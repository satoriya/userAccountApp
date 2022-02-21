//
//  LoginModel.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 20/02/22.
//

import Foundation

struct LoginModel: Codable {
    let status, token, username, accountNo: String?
}


struct LoginBody: Codable {
    var username: String
    var password: String
}
