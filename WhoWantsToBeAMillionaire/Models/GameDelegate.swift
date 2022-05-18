//
//  GameDelegate.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import Foundation

protocol GameDelegate: AnyObject {
    func didEndGame(withScore score: Int)
}
