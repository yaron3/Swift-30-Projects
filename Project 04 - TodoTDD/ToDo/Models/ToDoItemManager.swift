//
//  ToDoItemManager.swift
//  ToDo
//
//  Created by gu, yi on 9/6/18.
//  Copyright © 2018 gu, yi. All rights reserved.
//

import Foundation
import SwiftUI

class ToDoItemManager: ObservableObject {
    @Published private(set) var toDoItems = [ToDoItem]()
    @Published private(set) var doneItems = [ToDoItem]()
    
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count }
    
    // plist related
    var toDoPathURL: URL {
        let fileURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let documentURL = fileURLs.first else {
            fatalError("Something went wrong. Documents url could not be found")
        }
        
        return documentURL.appendingPathComponent("toDoItems.plist")
    }
    
    init() {
        if let nsToDoItems = NSArray(contentsOf: toDoPathURL) {
            for dict in nsToDoItems {
                if let toDoItem = ToDoItem(dict: dict as! [String:Any]) {
                    toDoItems.append(toDoItem)
                }
            }
        }
    }
    
    func save() {
        let nsToDoItems = toDoItems.map { $0.plistDict }
        
        guard nsToDoItems.count > 0 else {
            try? FileManager.default.removeItem(at: toDoPathURL)
            return
        }
        
        do {
            let plistData = try PropertyListSerialization.data(
                fromPropertyList: nsToDoItems,
                format: PropertyListSerialization.PropertyListFormat.xml,
                options: PropertyListSerialization.WriteOptions(0)
            )
            try plistData.write(to: toDoPathURL,
                                options: Data.WritingOptions.atomic)
        } catch {
            print(error)
        }
    }
    
    func add(_ item: ToDoItem) {
        toDoItems.append(item)
        save()
    }
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func checkItem(at index: Int) {
        let checkedItem = toDoItems.remove(at: index)
        doneItems.append(checkedItem)
        save()
    }
    
    func uncheckItem(at index: Int) {
        let uncheckedItem = doneItems.remove(at: index)
        toDoItems.append(uncheckedItem)
        save()
    }
    
    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
        save()
    }
}
