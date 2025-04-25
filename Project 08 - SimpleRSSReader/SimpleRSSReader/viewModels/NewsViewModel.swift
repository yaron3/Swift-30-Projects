import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var newsItems: [NewsItem] = []
    @Published var isLoading = false
    
    private let feedParser = FeedParser()
    private let feedURL = "https://rss.nytimes.com/services/xml/rss/nyt/World.xml"
    
    init() {
        Task {
            await fetchNews()
        }
    }
    
    func fetchNews() async {
        isLoading = true
        defer { isLoading = false }
        
        await withCheckedContinuation { continuation in
            feedParser.parseFeed(feedURL: feedURL) { [weak self] items in
                self?.newsItems = items.map { item in
                    NewsItem(
                        title: item.title,
                        description: item.description,
                        pubDate: item.pubDate
                    )
                }
                continuation.resume()
            }
        }
    }
} 