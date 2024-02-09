//
//  FriendRequest.swift
//  BillGuard
//
//  Created by Martin Navarro on 21/2/24.
//

import Foundation

struct FriendRequest: Codable {
    let senderUID: String
    let timestamp: TimeInterval
    let status: String // "pending", "accepted", "rejected"
}
