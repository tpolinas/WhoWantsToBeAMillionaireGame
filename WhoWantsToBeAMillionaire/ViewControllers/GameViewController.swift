//
//  GameViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import UIKit

final class GameViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var answer1: UIButton!
    @IBOutlet var answer2: UIButton!
    @IBOutlet var answer3: UIButton!
    @IBOutlet var answer4: UIButton!
    @IBOutlet var callFriendLifeline: UIButton!
    @IBOutlet var audienceHelpLifeline: UIButton!
    @IBOutlet var removeTwoLifeline: UIButton!
    @IBOutlet var takeCashLifeline: UIButton!
    weak var delegate: GameDelegate?
    var answerButtonsCollection = [UIButton]()
    var lifelineButtonsCollection = [UIButton]()
    
    @IBAction func exitToMainMenuButton() {
        takeCash()
    }
    
    @IBAction func answerPressed(sender: UIButton!) {
        hideQuestion()
        setupScoreLabel()
        rightAnswer == sender.tag ? didAnsweredRight() : gameLost()
    }
    
    @IBAction func lifelinePressed(sender: UIButton!) {
        switch sender {
        case removeTwoLifeline:
            removeTwo()
        case callFriendLifeline:
            callFriend()
        case audienceHelpLifeline:
            audienceHelp()
        case takeCashLifeline:
            takeCash()
        default:
            break
        }
    }
    
    let scoreValues = [
        0: 0,
        1: 100,
        2: 500,
        3: 1_000,
        4: 5_000,
        5: 10_000,
        6: 50_000,
        7: 100_000,
        8: 500_000,
        9: 999_000,
        10: 1_000_000
    ]
    
    var gameSession = GameSession()
    
    var initialProgressIndicatorPosition = CGFloat()
    var score = 0
    var questionNumber = 0 {
        didSet {
            gameSession.questionNumber = questionNumber
            guard
                let score = scoreValues[questionNumber]
            else { return }
            self.score = score
        }
    }
    
    var rightAnswer = Int() {
        didSet {
            wrongAnswers = [1,2,3,4].filter({ $0 != rightAnswer })
        }
    }
    
    var wrongAnswers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup() {
        delegate = Game.instance
        Game.instance.gameSession = gameSession
        answerButtonsCollection = [
            answer1,
            answer2,
            answer3,
            answer4
        ]
        answerButtonsCollection.forEach {
            $0.titleLabel?.textAlignment = .center
        }
        lifelineButtonsCollection = [
            removeTwoLifeline,
            callFriendLifeline,
            audienceHelpLifeline,
            takeCashLifeline
        ]
        setupQuestion()
    }
    
    func setupQuestion(action: UIAlertAction! = nil) {
        title = "Question \(questionNumber + 1)"
        answerButtonsCollection.forEach { $0.isHidden = false }
        if questionNumber > 0 { setupScoreLabel() }
        let currentQuestion = questionsSet[questionNumber]
        questionLabel.text = currentQuestion.question
        answer1.setTitle(currentQuestion.answers[0], for: .normal)
        answer2.setTitle(currentQuestion.answers[1], for: .normal)
        answer3.setTitle(currentQuestion.answers[2], for: .normal)
        answer4.setTitle(currentQuestion.answers[3], for: .normal)
        rightAnswer = currentQuestion.rightAnswer
    }
    
    func setupScoreLabel() {
        let increaseScore = score
        self.scoreLabel.text = "$\(increaseScore)"
    }
    
    func hideQuestion() {
        questionLabel.text = ""
        answerButtonsCollection.forEach { $0.setTitle(
                                                "",
                                                for: .normal) }
    }
    
    func didAnsweredRight() {
        questionNumber += 1
        if questionNumber < 10 {
            let alert = UIAlertController(
                            title: "Correct!",
                            message: "Your current score is: $\(score)",
                            preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                            title: "Continue",
                            style: .default,
                            handler: setupQuestion))
            present(
                alert,
                animated: true)
        } else {
            gameWon()
        }
    }
    
    func gameWon(action: UIAlertAction! = nil) {
        hideQuestion()
        let alert = UIAlertController(
                        title: "CONGRATULATIONS!",
                        message: "YOU WON $\(score)",
                        preferredStyle: .alert)
        if questionNumber == 10 { alert.addAction(UIAlertAction(
                                                title: "New Game",
                                                style: .default,
                                                handler: restartGame)) }
        alert.addAction(UIAlertAction(
            title: "Exit",
            style: .default,
            handler: exitToMainMenu))
        present(
            alert,
            animated: true)
        delegate?.didEndGame(withScore: score)
    }
    
    func gameLost() {
        switch score {
        case 0..<1_000:
            score = 0
        case 1_000..<50_000:
            score = 1_000
        case 50_000..<1_000_000:
            score = 500_000
        default:
            break
        }
        
        let alert = UIAlertController(
                        title: "Wrong!",
                        message: "Sorry, you've lost! Your score is: $\(score)",
                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(
                        title: "New game",
                        style: .default,
                        handler: restartGame))
        alert.addAction(UIAlertAction(
                        title: "Exit",
                        style: .default,
                        handler: exitToMainMenu))
        present(
            alert,
            animated: true)
        delegate?.didEndGame(withScore: score)
    }
    
    func restartGame(action: UIAlertAction! = nil) {
        questionNumber = 0
        lifelineButtonsCollection.forEach { $0.isEnabled = true }
        gameSession.removeTwoUsed = false
        gameSession.callFriendUsed = false
        gameSession.audienceHelpUsed = false
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in self.setupQuestion() })
    }
    
    func exitToMainMenu(action: UIAlertAction! = nil) {
        navigationController?.popViewController(animated: true)
        Game.instance.gameSession = nil
    }
    
// MARK: lifeline methods
    
    func removeTwo() {
        removeTwoLifeline.isEnabled = false
        gameSession.removeTwoUsed = true
        
        var buttons = answerButtonsCollection
        buttons.remove(at: rightAnswer - 1)
        buttons.remove(at: Int.random(in: 0...buttons.count - 1))
        buttons.forEach({ $0.isHidden = true })
    }
    
    func callFriend() {
        callFriendLifeline.isEnabled = false
        gameSession.callFriendUsed = true
        
        let randomNumber = Int.random(in: 1...10)
        var friendsAnswer = Int()
        var isSure = false
        switch randomNumber {
        case 1, 2, 3, 5, 7, 8, 9:
            friendsAnswer = rightAnswer
            isSure = true
        case 4, 6:
            if let wrongAnswer = wrongAnswers.randomElement() {
                friendsAnswer = wrongAnswer
                isSure = false
            }
        default:
            friendsAnswer = 0
        }
        
        var message = ""
        switch friendsAnswer {
        case 0:
            message = "Sorry, I really have no idea. \n Lean upon only your own feeling of right."
        case 1:
            message = isSure ? "I guess the first one is correct." : "I'm not sure, but the first one might be correct."
        case 2:
            message = isSure ? "I think the second one is right." : "I'm not dare to sure, but I guess the second one is correct."
        case 3:
            message = isSure ? "I think it might be third one." : "I don't actually know, but third one seems correct to me."
        case 4:
            message = isSure ? "The forth one is right, I guess." : "In my point of view, the forth answer might be correct."
        default:
            break
        }
        
        let alert = UIAlertController(
                        title: "Hey, bro!",
                        message: message,
                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(
                        title: "Got It!",
                        style: .default,
                        handler: nil))
        present(
            alert,
            animated: true)
    }
    
    func audienceHelp() {
        audienceHelpLifeline.isEnabled = false
        gameSession.audienceHelpUsed = true

        let rightVote = Int.random(in: 55...99)
        var voteResults = [Int : Int]()
        voteResults[rightAnswer] = rightVote
        
        if wrongAnswers.count == 3 {
            let wrongVote1 = Int.random(in: 0...100 - rightVote)
            let wrongVote2 = Int.random(in: 0...100 - rightVote - wrongVote1)
            let wrongVote3 = 100 - rightVote - wrongVote1 - wrongVote2
            voteResults[wrongAnswers[0]] = wrongVote1
            voteResults[wrongAnswers[1]] = wrongVote2
            voteResults[wrongAnswers[2]] = wrongVote3
        } else {
            voteResults[wrongAnswers[0]] = 100 - rightVote
        }
        
        let alert = UIAlertController(title: "Audience voting results:", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Got It!", style: .default, handler: nil))
        
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = NSTextAlignment.left
         
        let message = NSMutableAttributedString(
            string: """
                    
                        1 - \(voteResults[1] ?? 0)%
                        2 - \(voteResults[2] ?? 0)%
                        3 - \(voteResults[3] ?? 0)%
                        4 - \(voteResults[4] ?? 0)%
                    
                    """,
            attributes: [
                NSAttributedString.Key.paragraphStyle: textStyle
            ])
         
        alert.setValue(
            message,
            forKey: "attributedMessage")
        present(
            alert,
            animated: true)
    }
    
    func takeCash() {
        let alert = UIAlertController(
                        title: "Are you sure?",
                        message: "Do you really want to take your $\(score) and leave the game?",
                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(
                        title: "Yes, I'm sure!",
                        style: .default,
                        handler: gameWon))
        alert.addAction(UIAlertAction(
                        title: "No!",
                        style: .cancel,
                        handler: nil))
        present(
            alert,
            animated: true)
    }
}
