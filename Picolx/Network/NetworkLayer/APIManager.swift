//
//  APIManager.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/1/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import Alamofire

class APIManager: NSObject {
    //Needed to specify here with the Swift.Result otherwise it was confliciting between the two Results with one of those of Alamofire.
    func request(urlRequest: Router, completion: @escaping (_ response: Swift.Result<Data, Error>) -> ()) {
        Alamofire.request(urlRequest).responseData { (response) in
            if let data = response.data, data.count > 0 {
                completion(.success(data))
            } else if let error = response.error {
               completion(.failure(error))
            }
        }
    }
}
