//
//  RecordsCaretaker.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import Foundation

class RecordsCaretaker {
    
    // MARK: - Private constants
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "records"
    
    // MARK: - Functions
    
    func save(records: [Record]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.set(
                                    data,
                                    forKey: key)
        } catch {
            print(error)
        }
    }
    
    func receiveRecords() -> [Record] {
        guard
            let data = UserDefaults.standard.value(forKey: key) as? Data
        else { return [] }
        do {
            return try decoder.decode(
                                [Record].self,
                                from: data)
        } catch {
            print(error)
            return []
        }
    }
}

