//
//  QuestionBuilder.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import Foundation

final class QuestionBuilder {
    
    // MARK: - Properties
    
    private(set) var questions: [Question] = []
    private(set) var difficulty: [Difficulty] = [.easy]
    private(set) var question: [String] = []
    private(set) var answers: [[String]] = []
    private(set) var rightAnswer: [Int] = []
    
    // MARK: - Public functions

    func build(questionNumbers: Int) -> [Question] {
        for number in 0..<questionNumbers {
            questions.append(
                Question(
                    question: question[number],
                    answers: answers[number],
                    rightAnswer: rightAnswer[number],
                    difficulty: difficulty[number]))
        }
        return questions
    }
        
    func setQuestion(_ question: String, number: Int) {
        self.question.insert(question, at: number)
    }
    
    func setRightAnswer(_ rightAnswer: Int, number: Int) {
        self.rightAnswer.insert(rightAnswer, at: number)
    }
    
    func setAnswers(_ answers: [String], number: Int) {
        self.answers.insert(answers, at: number)
    }
    
    func setDifficulty(_ difficulty: Difficulty, number: Int) {
        self.difficulty.insert(difficulty, at: number)
    }
}
