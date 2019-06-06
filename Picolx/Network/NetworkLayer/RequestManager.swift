//
//  RequestManager.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/1/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import Foundation
/// For Networking purposes. A Router object needs to be passed in for making a network request.
class RequestManager: NSObject {
    
    // MARK: - Dependency vars
    
    private let apiManager: APIManager
    
    // MARK: - Init
    
    init(apiManager: APIManager = APIManager()) {
        self.apiManager = apiManager
    }
    
    // MARK: - Function
    
    /**
     
     Sending requests to the server.
     
     - Parameter router: Create a router by implementing the protocl Router
     
     - Parameter completion: A closure returns a Result
     
     - Parameter response: Result<T, Error>. Type T is converted to the model provided. A success(Decodable) or failure(Error) is returned.
     
     */
    
    func request<T: Decodable>(router: Router, completion: @escaping (_ response: Swift.Result<T, Error>) -> ()) {
        apiManager.request(urlRequest: router) { (resp) in
            switch resp {
            case .success(let data):
                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(model))
                    
                } catch {
                    completion(.failure(error))
                }
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
            
        }
        
    }
}
