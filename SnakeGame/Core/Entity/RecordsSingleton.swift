//
//  RecordsSingleton.swift
//  SnakeGame
//
//  Created by admin on 04.11.2022.
//

import Foundation

struct Record: Codable {
    let name: String
    let date: Date
    let score: Int
}

class Records {
    static let shared = Records()
    private let recordsCaretaker = RecordsCaretaker()
    private var records = [Record]() {
        didSet {
            try? recordsCaretaker.saveRecords(records: records)
        }
    }
    
    private init() {
        if let records = try? recordsCaretaker.loadRecords() {
            self.records = records
        }
    }
    func getRecords() -> [Record] {
        return records
    }
    
    func sortRecordsByScore() {
        records = records.sorted(by: {$0.score > $1.score})
    }
    
    func sortRecordsByName() {
        records = records.sorted(by: {$0.name < $1.name})
    }
    
    func sortRecordsByDate() {
        records = records.sorted(by: {$0.date > $1.date})
    }
    
    func addRecord(name: String, score: Int) {
        records.append(Record(name: name, date: Date(), score: score))
        sortRecordsByScore()
    }
    
    func clearRecords() {
        records.removeAll()
    }
}
