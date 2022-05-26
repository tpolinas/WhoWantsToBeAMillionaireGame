//
//  AddQuestionCell.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import UIKit

class AddQuestionCell: UITableViewCell {
    
    // MARK: - IBOutlet properties
    
    @IBOutlet var questionNumberLabel: UILabel!
    @IBOutlet var question: UITextField! 
    @IBOutlet var answer1: UITextField!
    @IBOutlet var answer2: UITextField!
    @IBOutlet var answer3: UITextField!
    @IBOutlet var answer4: UITextField!
    @IBOutlet var rightAnswerSelector: UISegmentedControl! {
        didSet {
            rightAnswerSelector.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .normal)
            rightAnswerSelector.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .selected)
        }
    }
    
    @IBOutlet var difficultySelector: UISegmentedControl! {
        didSet {
            difficultySelector.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .normal)
            difficultySelector.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .selected)
        }
    }
    
    // MARK: - Functions
    
    override func setSelected(
        _ selected: Bool,
        animated: Bool
    ) {
        super.setSelected(
            selected,
            animated: animated)
    }
}

