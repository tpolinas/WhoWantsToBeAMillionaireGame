//
//  AddQuestionDelegate.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import UIKit

protocol AddQuestionDelegate: AnyObject {
    func didTapAddQuestions(questions: [Question])
}
