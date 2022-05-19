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
    private init() { }
    
    // MARK: - Properties
    
    var records = [Record]() {
        didSet {
            recordsCaretaker.save(records: records)
        }
    }
    
    // MARK: - Public functions
    
    func addRecord(record: Record ) {
        self.records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
}

    // MARK: - Extensions

extension Game: GameDelegate {
    func didEndGame(withScore score: Int) {
        let newRecord = Record(
                            date: Date(),
                            score: score)
        Game.instance.addRecord(record: newRecord)
    }
}

