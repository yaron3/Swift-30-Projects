//
//  FBMeUser.swift
//  FacebookMe
//
//  Copyright © 2017 Yi Gu. All rights reserved.
//

import Foundation

struct FBMeUser {
    var name: String
    var education: String
}

struct TableSection: Identifiable {
    let id = UUID()
    let title: String
    let rows: [TableRow]
}

struct TableRow: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    var detailText: String?
}

let tableData: [TableSection] = [
    TableSection(title: "", rows: [
        TableRow(title: "Profile", imageName: "person.circle.fill")
    ]),
    TableSection(title: "See More...", rows: [
        TableRow(title: "Friends", imageName: "person.2.fill"),
        TableRow(title: "Events", imageName: "calendar"),
        TableRow(title: "Groups", imageName: "person.3.fill"),
        TableRow(title: "Education", imageName: "book.fill"),
        TableRow(title: "Town Hall", imageName: "building.2.fill"),
        TableRow(title: "Instant Games", imageName: "gamecontroller.fill")
    ]),
    TableSection(title: "Help Center", rows: [
        TableRow(title: "Help", imageName: "questionmark.circle.fill"),
        TableRow(title: "Privacy", imageName: "lock.fill"),
        TableRow(title: "Terms", imageName: "doc.text.fill")
    ]),
    TableSection(title: "Settings", rows: [
        TableRow(title: "Settings", imageName: "gear"),
        TableRow(title: "Logout", imageName: "arrow.right.square.fill")
    ])
]
