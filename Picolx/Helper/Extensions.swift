//
//  Extensions.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/2/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

extension String {
    var toURL: URL? {
        return URL(string: self)
    }
}

extension Int32 {
    var toString: String {
        return String(describing: self)
    }
}



