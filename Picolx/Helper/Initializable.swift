//
//  Initializable.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/2/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

protocol Initializable {
    static var storyboardIdentifier: String { get }
    static var storyboardName: UIStoryboard.Storyboard { get }
    static func instantiateViewController() -> Self
}

extension UIViewController: Initializable {}

extension Initializable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static var storyboardName: UIStoryboard.Storyboard {
        return UIStoryboard.Storyboard.main
    }
    
    static func instantiateViewController() -> Self {
        let storyboard = UIStoryboard.storyboard(storyboard: storyboardName)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
        
    }
}
