//
//  NetworkHelper.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 19/02/22.
//

import Foundation

enum RequestType: String {
    case POST = "POST"
    case GET = "GET"
}

class NetworkHelper: NSObject {
    
    static let shared :NetworkHelper = {
        return NetworkHelper()
    }()
    
    let task = URLSession.shared
    let token = UserDefaults.standard.string(forKey: Prefs.token.rawValue)
    
    func callApi<T:Decodable>(url: URL, model: T.Type, body: [String: Any] = ["":""], method: RequestType = .GET, completion: @escaping (Result<T, Error>, HTTPURLResponse?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if let token = token {
            request.setValue(token, forHTTPHeaderField: "Authorization")
        }
        
        
        if !body.isEmpty && method == .POST {
            let bodyData = try? JSONSerialization.data(
                withJSONObject: body,
                options: []
            )
            request.httpBody = bodyData
        }
        self.task.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let _error = error {
                    completion(.failure(_error),nil)
                    return
                }
                
                if let response = response as? HTTPURLResponse {
                    if let _data = data {
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let response = try decoder.decode(T.self, from: _data)
                            completion(.success(response), nil)
                            
                        } catch let error{
                            completion(.failure(error), response)
                        }
                    }
                }
                
            }
        }.resume()
        
        
    }
    
   
    
}

