//
//  MostViewedCategoryViewController.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/6/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class MostViewedCategoryViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var mostViewedImageView: UIImageView!
    @IBOutlet weak var mostViewedLabel: UILabel!
    
    // MARK: - Var
    
    //ViewModel
    let mostViewedViewModel = MostViewedViewModel()
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelCallback()
        mostViewedViewModel.mostViewed()
    }
    
    // MARK: - Functions
    
    private func setupViewModelCallback() {
        mostViewedViewModel.mostViewCategoryName = { [weak self] categoryName in
            self?.mostViewedImageView.image = UIImage(named: categoryName)
            self?.mostViewedLabel.text = categoryName.capitalized
        }
    }
    
    @IBAction func showAllCategoriesAction(_ sender: UIButton) {
        navigationController?.pushViewController(CategorySelectionViewController.instantiateViewController(), animated: true)
    }
    
}
