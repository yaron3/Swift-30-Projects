import SwiftUI

struct ContentView: View {
    @State private var candies = Candy.sampleCandies
    @State private var searchText = ""
    @State private var selectedCategory: String = "All"
    
    let categories = ["All", "Chocolate", "Hard", "Other"]
    
    var filteredCandies: [Candy] {
        candies.filter { candy in
            let matchesCategory = selectedCategory == "All" || candy.category == selectedCategory
            let matchesSearch = searchText.isEmpty || 
                candy.name.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesSearch
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                .pickerStyle(.segmented)
                .listRowBackground(Color.clear)
                
                ForEach(filteredCandies) { candy in
                    NavigationLink(destination: DetailView(candy: candy)) {
                        VStack(alignment: .leading) {
                            Text(candy.name)
                                .font(.headline)
                            Text(candy.category)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Candy Search")
            .searchable(text: $searchText, prompt: "Search candies")
        } detail: {
            Text("Select a candy")
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    ContentView()
} 