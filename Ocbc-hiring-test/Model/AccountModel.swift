//
//  AccountModel.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 19/02/22.
//

import Foundation

typealias AccountDatas = [AccountData]

struct AccountModel: Codable {
    let status: String
    let data: [AccountData]
}

// MARK: - Datum
struct AccountData: Codable {
    let transactionID: String
    let amount: Int
    let transactionDate, datumDescription, transactionType: String
    let receipient, sender: Receipient?
    
    func setDate() -> String {
        var data = ""
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-ddTHH:mm:ss"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MM yyyy"

        if let date = dateFormatterGet.date(from: transactionDate) {
            data = dateFormatterPrint.string(from: date)
        }
        
        return data
    }

    enum CodingKeys: String, CodingKey {
        case transactionID = "transactionId"
        case amount, transactionDate
        case datumDescription = "description"
        case transactionType, receipient, sender
    }
}

// MARK: - Receipient
struct Receipient: Codable {
    let accountNo, accountHolder: String
}
