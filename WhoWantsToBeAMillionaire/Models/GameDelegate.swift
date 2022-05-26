//
//  GameDelegate.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import Foundation
import UIKit

    // MARK: - Protocols

protocol GameDelegate: AnyObject {
    func didEndGame(
        difficulty: Difficulty,
        withScore score: Int,
        name: String,
        removeTwoUsed: Bool,
        callFriendUsed: Bool,
        audienceHelpUsed: Bool)
}
