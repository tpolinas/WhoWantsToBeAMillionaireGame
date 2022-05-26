//
//  MainMenuViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import UIKit

class MainMenuViewController: UIViewController {
    
        // MARK: - Private properties
    
    private let recordsCaretaker = RecordsCaretaker()
    private let userQuestionsCaretaker = UserQuestionsCaretaker()
    private var alertController = UIAlertController()
    var name = ""
    
        // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Initialization
        
        Game.instance.records = recordsCaretaker.receiveRecords()
        Game.instance.userQuestions = userQuestionsCaretaker.getQuestions()
        setupAlertController()
    }
    
        // MARK: - Private functions
    
    private func setupAlertController() {
        let alert = UIAlertController(
                        title: "Enter your name:",
                        message: nil,
                        preferredStyle: .alert)
        let enterNameAction = UIAlertAction(
                                title: "Play",
                                style: .default,
                                handler: setName.self)
        let cancelAction = UIAlertAction(
                                title: "Cancel",
                                style: .cancel)
        alert.addTextField { textField in
            textField.placeholder = "Player"
        }
        alert.addAction(enterNameAction)
        alert.addAction(cancelAction)
        alertController = alert
    }
    
    private func setName(action: UIAlertAction! = nil) {
        if let textField = alertController.textFields?.first {
            if let text = textField.text {
                name = (text != "") ? text : textField.placeholder ?? "Empty"
            }
        }
        performSegue(withIdentifier: "startGameSegue", sender: nil)
        name = ""
    }
}

