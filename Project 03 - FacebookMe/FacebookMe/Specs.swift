//
//  Specs.swift
//  FacebookMe
//
//  Copyright © 2017 Yi Gu. All rights reserved.
//

import SwiftUI

struct Specs {
    struct color {
        static let tint = Color(red: 0.0, green: 0.478, blue: 1.0, opacity: 1.0)
        static let gray = Color(red: 0.95, green: 0.95, blue: 0.95, opacity: 1.0)
    }
    
    struct fontSize {
        static let small: CGFloat = 12
        static let regular: CGFloat = 14
        static let large: CGFloat = 16
    }
    
    
    enum imageName: String {
        
        
        case friends = "fb_friends"
        case events = "fb_events"
        case groups = "fb_groups"
        case education = "fb_education"
        case townHall = "fb_town_hall"
        case instantGames = "fb_games"
        case settings = "fb_settings"
        case privacyShortcuts = "fb_privacy_shortcuts"
        case helpSupport = "fb_help_and_support"
        case placeholder = "fb_placeholder"
    }
}
