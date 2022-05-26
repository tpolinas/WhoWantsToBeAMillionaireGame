//
//  SettingsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 21.05.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    var gameSession = GameSession()
    
    // MARK: - Interface Builder
    
    @IBOutlet var difficultyControl: UISegmentedControl! {
        didSet {
            difficultyControl.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .normal)
            difficultyControl.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .selected)
        }
    }
    
    @IBAction func didChooseDifficulty(_ sender: UISegmentedControl) {
        switch selectedDifficulty {
        case .easy:
            chooseDifficultyStrategy.saveControlState(
                control: sender.selectedSegmentIndex)
        case .hard:
            chooseDifficultyStrategy.saveControlState(
                control: sender.selectedSegmentIndex)
        case .insane:
            chooseDifficultyStrategy.saveControlState(
                control: sender.selectedSegmentIndex)
        case .custom:
            chooseDifficultyStrategy.saveControlState(
                control: sender.selectedSegmentIndex)
        }
    }
    
    @IBOutlet var sequenceControl: UISegmentedControl! {
        didSet {
            sequenceControl.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .normal)
            sequenceControl.setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .selected)
        }
    }
    
    @IBAction func didChooseSequence(_ sender: UISegmentedControl) {
        
        // MARK: - Cases
        
        switch selectedSequence {
        case .sequentally:
            setupSelectedSequence.saveControlState(control: sender.selectedSegmentIndex)
        case .shuffled:
            setupSelectedSequence.saveControlState(control: sender.selectedSegmentIndex)
        }
    }
    
    // MARK: - Properties
    
    var difficulty: Difficulty = .hard {
        didSet {
            gameSession.difficulty = difficulty
        }
    }
    
    var sequence: Sequence = .sequentally {
        didSet {
            gameSession.sequence = sequence
        }
    }
    
    // MARK: - Private properties
    
    private var selectedSequence: Sequence {
        switch self.sequenceControl.selectedSegmentIndex {
        case 0: return .sequentally
        case 1: return .shuffled
        default: return .sequentally
        }
    }
    
    private var selectedDifficulty: Difficulty {
        switch self.difficultyControl.selectedSegmentIndex {
        case 0: return .easy
        case 1: return .hard
        case 2: return .insane
        default: return .hard
        }
    }
    
    private var chooseDifficultyStrategy: DifficultyStrategy {
        switch difficulty {
        case .easy: return EasyModeStrategy()
        case .hard: return HardModeStrategy()
        case .insane: return InsaneModeStrategy()
        case .custom: return CustomModeStrategy()
        }
    }
    
    private var setupSelectedSequence: SequenceStrategy {
        switch sequence {
        case .sequentally: return SequentiallyStrategy()
        case .shuffled: return ShuffledStrategy()
        }
    }
    
    // MARK: - Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestionsSequence()
        setupDifficulty()
    }
    
    // MARK: - Public functions
    
    func setupQuestionsSequence() {
            sequenceControl.selectedSegmentIndex = setupSelectedSequence.getControlState(control: sequenceControl.selectedSegmentIndex)
    }
    
    func setupDifficulty() {
        difficultyControl.selectedSegmentIndex = chooseDifficultyStrategy.getControlState(control: sequenceControl.selectedSegmentIndex)
    }
}
