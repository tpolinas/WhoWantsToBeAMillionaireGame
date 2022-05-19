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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Initialization
        
        Game.instance.records = recordsCaretaker.receiveRecords()
    }
}

