//
//  LoginService.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 20/02/22.
//

import Foundation


struct LoginService {
    typealias LoginResult = (LoginModel?, Error?, HTTPURLResponse?) -> ()
    var base = Constant.shared.host
    
    func fetchLogin(completion: @escaping(LoginResult)) {
        guard let url = URL(string: "\(base)/login") else {return}
        let body = [
            "username": "Nama"
            ,"password": "asdasd"
        ]
        NetworkHelper.shared.callApi(url: url, model: LoginModel.self, body: body, method: .POST) { result, response in
            switch result {
            case .failure(let err):
                completion(nil, err, response)
            case .success(let success):
                completion(success, nil, response)
            }
        }
    }
}
