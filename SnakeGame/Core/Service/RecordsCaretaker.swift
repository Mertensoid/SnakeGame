//
//  RecordsCaretaker.swift
//  SnakeGame
//
//  Created by admin on 04.11.2022.
//

import Foundation

class RecordsCaretaker {
    enum Error: Swift.Error {
        case recordsNotFound
    }
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    let key = "records"
    
    func saveRecords(records: [Record]) throws {
        let data: Data = try encoder.encode(records)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadRecords() throws -> [Record] {
        guard let data = UserDefaults.standard.value(forKey: key) as? Data,
              let records = try? decoder.decode([Record].self, from: data)
        else {
            throw Error.recordsNotFound
        }
        return records
    }
}
