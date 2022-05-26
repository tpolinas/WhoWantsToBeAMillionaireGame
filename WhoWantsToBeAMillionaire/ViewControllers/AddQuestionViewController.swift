//
//  AddQuestionViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import UIKit

class AddQuestionViewController: UIViewController,
                                 UITableViewDelegate,
                                 UITableViewDataSource,
                                 UIGestureRecognizerDelegate,
                                 UITextFieldDelegate {
    
    // MARK: - IBOutlet properties
    
    @IBOutlet var tableView: UITableView!
    @IBAction func addOneMoreQuestion(_ sender: Any) {
        guard numberOfQuestions < 3 else {
            let alert = UIAlertController(
                            title: "Hold on!",
                            message: "Please, enter one more question!",
                            preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                                title: "OK",
                                style: .cancel))
            present(alert, animated: true)
            return
        }
        numberOfQuestions += 1
        tableView.reloadData()
    }
    
    // MARK: - IBAction functions
    
    @IBAction func saveChanges(_ sender: Any) {
        if setupBuilder() {
            delegate?.didTapAddQuestions(
                questions: builder.build(
                    questionNumbers: numberOfQuestions))
            let alert = UIAlertController(
                            title: "Done",
                            message: "Questions has been added successfully!",
                            preferredStyle: .alert)
            alert.addAction(UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: popToMainMenu))
            present(
                alert,
                animated: true)
        }
    }
    // MARK: - Initialization
    
    weak var delegate: AddQuestionDelegate?
    private var numberOfQuestions = 1
    private let builder = QuestionBuilder()
    
    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        delegate = Game.instance
        tableView.registerWithNib(registerClass: AddQuestionCell.self)
        self.view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self.view,
                action: #selector(UIView.endEditing(_:))))
    }
    
    // MARK: - Private properties
    
    private var errorAlertController: UIAlertController {
        let alert = UIAlertController(
                        title: "Error",
                        message: "Please, check if all the lines are filled",
                        preferredStyle: .alert)
        let cancelAction = UIAlertAction(
                                title: "OK",
                                style: .cancel)
        alert.addAction(cancelAction)
        return alert
    }
    
    // MARK: - Functions
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        numberOfQuestions
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: AddQuestionCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.questionNumberLabel.text = "Question \(indexPath.row + 1)"
        return cell
    }
    
    func setupBuilder() -> Bool {
        for number in 0..<numberOfQuestions {
            let indexPath: IndexPath = [0, number]
            if let cell = tableView.cellForRow(at: indexPath) as? AddQuestionCell {
                if let question = cell.question.text {
                    guard question != "" else {
                        present(
                            errorAlertController,
                            animated: true)
                        return false
                    }
                    builder.setQuestion(
                                question,
                                number: number)
                }
                
                var answers: [String] = []
                if let answer1 = cell.answer1.text {
                    guard answer1 != "" else {
                        present(
                            errorAlertController,
                            animated: true)
                        return false
                    }
                    answers.append(answer1)
                }
                if let answer2 = cell.answer2.text {
                    guard answer2 != "" else {
                        present(
                            errorAlertController,
                            animated: true)
                        return false
                    }
                    answers.append(answer2)
                }
                if let answer3 = cell.answer3.text {
                    guard answer3 != "" else {
                        present(
                            errorAlertController,
                            animated: true)
                        return false
                    }
                    answers.append(answer3)
                }
                if let answer4 = cell.answer4.text {
                    guard answer4 != "" else {
                        present(
                            errorAlertController,
                            animated: true)
                        return false
                    }
                    answers.append(answer4)
                }
                builder.setAnswers(
                            answers,
                            number: indexPath.row)
                builder.setRightAnswer(
                    cell.rightAnswerSelector.selectedSegmentIndex + 1,
                    number: indexPath.row)
                switch cell.difficultySelector.selectedSegmentIndex {
                case 0: builder.setDifficulty(
                                        .easy,
                                        number: indexPath.row)
                case 1: builder.setDifficulty(
                                        .hard,
                                        number: indexPath.row)
                default: builder.setDifficulty(
                                        .easy,
                                        number: indexPath.row)
                }
            }
        }
        return true
    }
    
    func popToMainMenu(action: UIAlertAction! = nil) {
        navigationController?.popViewController(animated: true)
    }
}

