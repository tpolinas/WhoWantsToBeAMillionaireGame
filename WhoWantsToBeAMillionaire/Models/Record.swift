//
//  Record.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import Foundation

struct Record: Codable {
    
    // MARK: - Properties
    
    let date: Date
    let score: Int
    let name: String
    let difficulty: Difficulty
    let removeTwoUsed: Bool
    let callFriendUsed: Bool
    let audienceHelpUsed: Bool
}
