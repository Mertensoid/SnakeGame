//
//  RecordsViewController.swift
//  SnakeGame
//
//  Created by admin on 04.11.2022.
//

import UIKit

class RecordsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBAction func clearRecords() {
        Records.shared.clearRecords()
        tableView.reloadData()
    }
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RecordsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Records.shared.getRecords().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath)
        let record = Records.shared.getRecords()[indexPath.row]
        cell.textLabel?.text = record.name + " - " + formatter.string(from: record.date)
        cell.detailTextLabel?.text = "\(record.score)"
        return cell
    }
}


