//
//  Game.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import Foundation

class Game {
    
    // MARK: - Constants
    
    var gameSession: GameSession?
    static let instance = Game()
    private let recordsCaretaker = RecordsCaretaker()
    private let userQuestionsCaretaker = UserQuestionsCaretaker()
    private init() { }
    
    // MARK: - Properties
    
    var records = [Record]() {
        didSet {
            recordsCaretaker.save(records: records)
        }
    }
    
    var userQuestions = [Question]() {
        didSet {
            userQuestionsCaretaker.save(questions: userQuestions)
            print(userQuestions)
        }
    }
    
    // MARK: - Public functions
    
    func addRecord(record: Record ) {
        self.records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
    
    func addQuestions(questions: [Question]) {
        self.userQuestions.append(contentsOf: questions)
    }
    
    func clearUserQuestions() {
        userQuestions = []
    }
}

    // MARK: - Extensions

extension Game: GameDelegate {
    func didEndGame(
        difficulty: Difficulty,
        withScore score: Int,
        name: String,
        removeTwoUsed: Bool,
        callFriendUsed: Bool,
        audienceHelpUsed: Bool
    ) {
        let newRecord = Record(
            date: Date(),
            score: score,
            name: name,
            difficulty: difficulty,
            removeTwoUsed: removeTwoUsed,
            callFriendUsed: callFriendUsed,
            audienceHelpUsed: audienceHelpUsed)
        
        Game.instance.addRecord(record: newRecord)
    }
}

extension Game: AddQuestionDelegate {
    func didTapAddQuestions(questions: [Question]) {
        Game.instance.addQuestions(questions: questions)
    }
}
