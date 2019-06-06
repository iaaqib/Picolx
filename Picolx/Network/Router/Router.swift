//
//  Router.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/1/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import Alamofire
/// For creating Request. A Router needs to be implemented for any new request with path needs to be provided where as params are optional.
protocol Router: URLRequestConvertible  {
    
    var path: String { get }
    var params: [String : Any] { get }
}

extension Router {
    
    var baseURL: String {
        return "https://pixabay.com"
    }
    
    var key: String {
        return "12656433-b23ced8a34cecf9a80d4e16f0"
    }
    
    var params: [String : Any] {
        return [:]
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try self.baseURL.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(self.path))
        return try URLEncoding.default.encode(urlRequest, with: self.params)
    }
}
