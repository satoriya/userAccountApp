//
//  LoginViewModel.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 20/02/22.
//

import Foundation

class LoginViewModel {
    
    func getDatas(completion: @escaping () -> ()) {
        LoginService().fetchLogin { model, error, response in
            
            if let _error = error {
                completion()
            }
            
            if let success = model {
                UserDefaults.standard.set(success.token, forKey: Prefs.token.rawValue)
                completion()
            }
            
        }
    }
    
}
