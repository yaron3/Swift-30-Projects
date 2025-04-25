//
//  Interest.swift
//  Interests
//
//  Created by Duc Tran on 6/13/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//

import SwiftUI

struct Interest: Identifiable {
    let id: String
    let title: String
    let description: String
    let featuredImage: String
    var numberOfMembers: Int
    var numberOfPosts: Int
    
    init(id: String, title: String, description: String, featuredImage: String) {
        self.id = id
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
        self.numberOfMembers = 1
        self.numberOfPosts = 1
    }
    
    static func createInterests() -> [Interest] {
        return [
            Interest(id: "r1", title: "We Love Traveling Around the World", 
                    description: "We love backpack and adventures! We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", 
                    featuredImage: "r1"),
            Interest(id: "r2", title: "Romance Stories", 
                    description: "We love romantic stories. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", 
                    featuredImage: "r2"),
            Interest(id: "r3", title: "iOS Dev", 
                    description: "Create beautiful apps. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", 
                    featuredImage: "r3"),
            Interest(id: "r4", title: "Race", 
                    description: "Cars and aircrafts and boats and sky. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", 
                    featuredImage: "r4"),
            Interest(id: "r5", title: "Personal Development", 
                    description: "Meet life with full presence. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", 
                    featuredImage: "r5"),
            Interest(id: "r6", title: "Reading News", 
                    description: "Get up to date with breaking-news. We walked to Antartica yesterday, and camped with some cute pinguines, and talked about this wonderful app idea. 🐧⛺️✨", 
                    featuredImage: "r6")
        ]
    }
}
