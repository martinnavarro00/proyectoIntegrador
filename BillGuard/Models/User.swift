//
//  User.swift
//  BillGuard
//
//  Created by Martin Navarro on 21/2/24.
//

import Foundation


struct User: Codable, Hashable,Identifiable{
    
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    var friends: [String] = []
    var friendRequests: [String: FriendRequest] = [:]
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
}

struct friend: Codable{
    let id: String
}


