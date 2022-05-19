//
//  RecordsViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Polina Tikhomirova on 17.05.2022.
//

import UIKit

final class RecordsViewController: UIViewController,
                                    UITableViewDelegate,
                                    UITableViewDataSource {
    
    // MARK: - IBOutlet properties
    
    @IBOutlet var tableView: UITableView!
    @IBAction func clearButtonPressed(
        _ sender: UIBarButtonItem
    ) {
        Game.instance.clearRecords()
        self.tableView.reloadData()
    }
    
    // MARK: - Initialization
    
    private let dateFormater: DateFormatter = {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        return dateFormater
    }()
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        Game.instance.records.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
                                withIdentifier: "recordCell",
                                for: indexPath)
        let record = Game.instance.records[indexPath.row]
        cell.textLabel?.text = self.dateFormater.string(from: record.date)
        cell.detailTextLabel?.text = "\(record.score)$"
        return cell
    }
}
