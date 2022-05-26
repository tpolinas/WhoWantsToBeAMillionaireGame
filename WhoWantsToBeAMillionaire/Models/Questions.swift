//
//  Questions.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import Foundation

struct Question: Codable, Equatable {
    
    // MARK: - Properties
    
    let question: String
    let answers: [String]
    let rightAnswer: Int
    var difficulty: Difficulty
}
    
    // MARK: - Constants

let userQuestions = Game.instance.userQuestions

let allQuestions: [Question] = [
    question1,
    question2,
    question3,
    question4,
    question5,
    question6,
    question7,
    question8,
    question9,
    question10
]

let questionsSet: [Question] = [
    question1,
    question2,
    question5,
    question6,
    question8,
    question9,
    question10
]

let easyQuestionsSet: [Question] = [
    question3,
    question4,
    question7
]

    // MARK: - Constants

private let question1 = Question(
                            question: "What country is the city of Sault Ste. Marie?",
                            answers: [
                                "USA",
                                "Canada",
                                "Australia",
                                "UK"
                            ],
                            rightAnswer: 2,
                            difficulty: .hard)
private let question2 = Question(
                            question: "What instrument does Alex Lifeson of the rock band Rush play?",
                            answers: [
                                "Bass guitar",
                                "Drumset",
                                "Keyboards",
                                "Electric guitar"
                            ],
                            rightAnswer: 4,
                            difficulty: .hard)
private let question3 = Question(
                            question: "Which city is the coldest in the world?",
                            answers: [
                                "Eureka",
                                "Williston",
                                "Oymyakon",
                                "Nunavut"
                            ],
                            rightAnswer: 3,
                            difficulty: .easy)
private let question4 = Question(
                            question: "What was the name of the third president of the United States?",
                            answers: [
                                "James Madison",
                                "Thomas Jefferson",
                                "James Knox Polk",
                                "Andrew Jackson"
                            ],
                            rightAnswer: 2,
                            difficulty: .easy)
private let question5 = Question(
                            question: "Who wrote the song \"Seven And Seven Is\"?",
                            answers: [
                                "Arthur Lee",
                                "Alice Cooper",
                                "Ramones",
                                "Deep Purple"
                            ],
                            rightAnswer: 1,
                            difficulty: .insane)
private let question6 = Question(
                            question: "What is Facebook's COO's name?",
                            answers: [
                                "David Wehner",
                                "Sheryl Sandberg",
                                "‎Tom Alison",
                                "Nick Clegg"
                            ],
                            rightAnswer: 2,
                            difficulty: .insane)
private let question7 = Question(
                            question: "In which city does the sun rise first?",
                            answers: [
                                "Mumbai​",
                                "Arunachal Pradesh",
                                "Gisborne",
                                "Kolkata"
                            ],
                            rightAnswer: 3,
                            difficulty: .easy)
private let question8 = Question(
                            question: "Which creature lives the least?",
                            answers: [
                                "Mayfly",
                                "Fruit Fly",
                                "Worker Bee",
                                "Dragonfly"
                            ],
                            rightAnswer: 1,
                            difficulty: .insane)
private let question9 = Question(
                            question: "Who is the greatest drummer in the world?",
                            answers: [
                                "Keith Moon",
                                "Neil Peart",
                                "Jason Bonham",
                                "Buddy Rich"
                            ],
                            rightAnswer: 2,
                            difficulty: .hard)
private let question10 = Question(
                            question: "Which airport code did the rock band Rush use as the name of the instrumental song YYZ?",
                            answers: [
                                "Charlottetown",
                                "Armstrong",
                                "Toronto Pearson",
                                "Smithers"
                            ],
                            rightAnswer: 3,
                            difficulty: .hard)

