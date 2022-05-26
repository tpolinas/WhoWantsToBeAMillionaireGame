//
//  DifficulityStrategies.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import UIKit

// MARK: - Constant properties

fileprivate var key = "chosenDifficulity"

// MARK: - Protocols

protocol DifficultyStrategy {
    func setupGame(lifelineButtons: [UIButton]) -> [Question]
    func getControlState(control: Any) -> Int
    func saveControlState(control: Any)
    func getDifficulityControlState() -> Int
}

// MARK: - Protocols implementation

final class EasyModeStrategy: DifficultyStrategy {
    func getDifficulityControlState() -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = true })
        switch getDifficulityControlState() {
        case 0:
            return easyQuestionsSet
        case 1:
            return questionsSet
        case 2:
            return allQuestions
        case 3:
            return userQuestions
        default:
            return questionsSet
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

final class HardModeStrategy: DifficultyStrategy {
    func getDifficulityControlState() -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = true })
        switch getDifficulityControlState() {
        case 0:
            return easyQuestionsSet
        case 1:
            return questionsSet
        case 2:
            return allQuestions
        case 3:
            return userQuestions
        default:
            return questionsSet
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

final class InsaneModeStrategy: DifficultyStrategy {
    func getDifficulityControlState() -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        lifelineButtons.forEach({ $0.isHidden = true })
        lifelineButtons.forEach({ $0.isEnabled = false })
        switch getDifficulityControlState() {
        case 0:
            return easyQuestionsSet
        case 1:
            return questionsSet
        case 2:
            return allQuestions
        case 3:
            return userQuestions
        default:
            return questionsSet
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

final class CustomModeStrategy: DifficultyStrategy {
    func getDifficulityControlState() -> Int {
        guard
            let data = UserDefaults.standard.value(
                            forKey: key) as? Int
        else { return Int() }
        do {
            return data
        }
    }
    
    func setupGame(lifelineButtons: [UIButton]) -> [Question] {
        lifelineButtons.forEach({ $0.isEnabled = true })
        switch getDifficulityControlState() {
        case 0:
            return easyQuestionsSet
        case 1:
            return questionsSet
        case 2:
            return allQuestions
        case 3:
            return userQuestions
        default:
            return questionsSet
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
