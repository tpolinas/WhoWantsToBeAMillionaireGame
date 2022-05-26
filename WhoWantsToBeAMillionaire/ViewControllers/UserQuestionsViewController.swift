//
//  UserQuestionsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import UIKit

class UserQuestionsViewController: UIViewController,
                                   UITableViewDelegate,
                                   UITableViewDataSource {
    
    // MARK: - Interface Builder
    
    @IBOutlet var tableView: UITableView!
    @IBAction func clearButtonpressed(_ sender: Any) {
        let alert = UIAlertController(
                        title: "Are you sure?",
                        message: "All questions will be deleted",
                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(
                            title: "OK",
                            style: .default,
                            handler: clearQuestions))
        alert.addAction(UIAlertAction(
                            title: "Cancel",
                            style: .cancel))
        present(
            alert,
            animated: true)
    }
    
    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Functions
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        Game.instance.userQuestions.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
                            withIdentifier: "userQuestionCell",
                            for: indexPath)
        let question = Game.instance.userQuestions[indexPath.row]
        var rightAnswerLetter: String {
            switch question.rightAnswer {
            case 1: return "1"
            case 2: return "2"
            case 3: return "3"
            case 4: return "4"
            default: return "error"
            }
        }
        cell.textLabel?.text = """
                            Question \(indexPath.row + 1): \(question.question)
                            Answers:
                                1: \(question.answers[0])
                                2: \(question.answers[1])
                                3: \(question.answers[2])
                                4: \(question.answers[3])
                            Right Answer: \(rightAnswerLetter)
                            Difficulty: \(question.difficulty.rawValue)
                            """
        cell.textLabel?.numberOfLines = 10
        cell.textLabel?.textColor = .white
        cell.selectionStyle = .none
        return cell
        }
    
    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {
            Game.instance.userQuestions.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func clearQuestions(action: UIAlertAction! = nil) {
        Game.instance.clearUserQuestions()
        self.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
