//
//  Product.swift
//  GoodAsOldPhones
//
//  Copyright © 2016 Code School. All rights reserved.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let cellImageName: String
    let fullscreenImageName: String
}
