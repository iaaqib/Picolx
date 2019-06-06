//
//  SplashViewController.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/6/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    // MARK: - Var
    
    //ViewModel
    let splashViewModel = SplashViewModel()
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perform(#selector(loadController), with: nil, afterDelay: 0.6)
    }
    
    // MARK: - Function
    
    @objc func loadController() {
        
        dismiss(animated: false)
        let navigationController = UINavigationController.instantiateViewController()
        if splashViewModel.isMostViewed {
            navigationController.setViewControllers([MostViewedCategoryViewController.instantiateViewController()], animated: true)
        } else {
            navigationController.setViewControllers([CategorySelectionViewController.instantiateViewController()], animated: true)
        }
        UIApplication.shared.delegate?.window??.rootViewController = navigationController
        UIApplication.shared.delegate?.window??.makeKeyAndVisible()
        
    }
    
}
