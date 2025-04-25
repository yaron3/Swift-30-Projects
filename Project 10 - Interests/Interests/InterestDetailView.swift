//
//  InterestDetailView.swift
//  Interests
//
//  Created by Yaron Jackoby on 25/04/2025.
//  Copyright © 2025 YiGu. All rights reserved.
//

import SwiftUI

struct InterestDetailView: View {
    let interest: Interest
    @Environment(\.dismiss) private var dismiss
    

    init(interest: Interest) {
        self.interest = interest
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Image(interest.featuredImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text(interest.title)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text(interest.description)
                                .font(.body)
                                .foregroundColor(.secondary)
                            
                            HStack {
                                Label("\(interest.numberOfMembers) members", systemImage: "person.2")
                                Spacer()
                                Label("\(interest.numberOfPosts) posts", systemImage: "doc.text")
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }
                        .padding(.horizontal, 30)
                    }
                }
                .background(Color.clear)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            dismiss()
                        }
                    }
                }
                
                
            }
        }
        
    }
}

#Preview {
    InterestDetailView(interest: Interest.createInterests()[0])
}
