//
//  SequenceStrategies.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 22.05.2022.
//

import UIKit

// MARK: - Constant properties

fileprivate var key = "chosenSequence"

// MARK: - Protocols

protocol SequenceStrategy {
    func setupGame(
        lifelineButtons: [UIButton],
        _ questions: [Question]
    ) -> [Question]
    func getControlState(control: Any) -> Int
    func saveControlState(control: Any)
    func getSequenceControlState() -> Int
}

// MARK: - Protocols implementation

final class SequentiallyStrategy: SequenceStrategy {
    func getSequenceControlState() -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func setupGame(
        lifelineButtons: [UIButton],
        _ questions: [Question]
    ) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = true })
        switch getSequenceControlState() {
        case 0:
            return questions
        case 1:
            return questions.shuffled()
        default:
            return questions
        }
    }
    
    func getControlState(control: Any) -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func saveControlState(control: Any) {
        do {
            UserDefaults.standard.set(
                                    control,
                                    forKey: key)
        }
    }
}

final class ShuffledStrategy: SequenceStrategy {
    func getSequenceControlState() -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func setupGame(
        lifelineButtons: [UIButton],
        _ questions: [Question]
    ) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = true })
        switch getSequenceControlState() {
        case 0:
            return questions
        case 1:
            return questions.shuffled()
        default:
            return questions
        }
    }
    
    func getControlState(control: Any) -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func saveControlState(control: Any) {
        do {
            UserDefaults.standard.set(
                                    control,
                                    forKey: key)
        }
    }
}

