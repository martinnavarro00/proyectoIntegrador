//
//  ItemModel.swift
//  BillGuard
//
//  Created by Martin Navarro on 21/2/24.
//

import Foundation

struct ToDoListItem: Codable,Identifiable{
    let id: String
    let title: String
    let type: String
    let createdDate: TimeInterval
    let colorCat: String
    
    
    
}
