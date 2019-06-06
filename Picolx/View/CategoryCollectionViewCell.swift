//
//  CategoryCollectionViewCell.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/2/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var viewsStackView: UIStackView!
    @IBOutlet weak var viewsLabel: UILabel!
    
    // MARK: - Functions
    
    override func awakeFromNib() {
        categoryTitleLabel.isHidden = true
        viewsStackView.isHidden = true
    }
    
    // Showing the pictures list
    func setup(viewModel: Hit) {

        categoryImageView.kf.indicatorType = .activity
        categoryImageView.kf.setImage(with: viewModel.webformatURL?.toURL)
        
    }
    
    // Showing the categories from the menu
    func showCategory(category: String, views: String) {
        categoryTitleLabel.isHidden = false
        viewsStackView.isHidden = false
        categoryTitleLabel.text = category.capitalized
        categoryImageView.image = UIImage(named: category)
        viewsLabel.text = views
    }
}
