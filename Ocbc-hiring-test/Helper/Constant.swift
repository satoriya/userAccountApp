//
//  Constant.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 19/02/22.
//

import Foundation

enum Prefs: String {
    case token
}

struct Constant {
    
    static let shared :Constant = {
        return Constant()
    }()
    
    let host = "https://green-thumb-64168.uc.r.appspot.com"
    let token = ""
    
}
