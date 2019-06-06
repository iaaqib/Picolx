//
//  CategoryRouter.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/1/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import Foundation

enum CategoryRouter: Router {
    
    case getPhotosWith(category: String)
    
    
    var path: String {
        return "/api"
    }
    
    var params: [String : Any] {
        switch self {
        case .getPhotosWith(let category):
            return ["key" : key, "image_type" : "photo", "category" : category]
        }
    }
    
}
