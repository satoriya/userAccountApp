//
//  AccountService.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 19/02/22.
//

import Foundation

protocol AccountServiceProtocol {
    func fetchTransactions(completion: @escaping(_ model: AccountModel?,_ error: Error?,_ response: HTTPURLResponse?) -> ())
}

class AccountService: AccountServiceProtocol {
    
    func fetchTransactions(completion: @escaping(AccountModel?, Error?, HTTPURLResponse?) -> ()) {
        let base = Constant.shared.host
        guard let url = URL(string: "\(base)/transactions") else {return}
        
        NetworkHelper.shared.callApi(url: url, model: AccountModel.self) { result, response   in
            switch result {
            case .failure(let err):
                completion(nil, err, response)
            case .success(let success):
                completion(success, nil, response)
            }
        }
    }
}
