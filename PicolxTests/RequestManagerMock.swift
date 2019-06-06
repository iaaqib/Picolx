//
//  RequestManagerMock.swift
//  PicolxTests
//
//  Created by Aaqib Hussain on 6/6/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import Foundation
@testable import Picolx

class RequestManagerMock: RequestManager {

    override func request<T>(router: Router, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable {
        guard let data = loadJson(url: router.urlRequest!.url!) else {return}
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            completion(.success(json))
        } catch {
            completion(.failure(error))
        }
    }
    
    private func loadJson(url: URL) -> Data? {
        do {
            let data = try Data(contentsOf: url, options: .dataReadingMapped)
            return data
        } catch {
            // handle error
            print(error.localizedDescription)
            return nil
        }
    }
}

enum FileRouter: Router {
    
    case getNature
    
    var path: String {
        return "Category"
    }
    
    func asURLRequest() throws -> URLRequest {
        let path = Bundle.main.path(forResource: self.path, ofType: "json")
        let fileURL = URL(fileURLWithPath: path!)
        let url = URLRequest(url: fileURL)
        return url
    }
}
