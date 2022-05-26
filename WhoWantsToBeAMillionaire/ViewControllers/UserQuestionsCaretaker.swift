//
//  UserQuestionsCaretaker.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import Foundation

class UserQuestionsCaretaker {
    
    // MARK: - Private constants
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    
    // MARK: - Functions
    
    func save(questions: [Question]) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.set(
                                    data,
                                    forKey: key)
        } catch {
            print(error)
        }
    }
    
    func getQuestions() -> [Question] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else { return [] }
        do {
            return try decoder.decode(
                                [Question].self,
                                from: data)
        } catch {
            print(error)
            return []
        }
    }
}
