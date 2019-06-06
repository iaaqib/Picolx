//
//  ImagePreviewViewController.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/2/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
    // MARK: - Var
    
    var hit: Hit!
    
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup(model: hit)
    }
    
    // MARK: - Functions
    
    func setup(model: Hit) {
        previewImageView.kf.indicatorType = .activity
        userImageView.kf.indicatorType = .activity
        userImageView.layer.cornerRadius = userImageView.frame.size.height / 2
        userNameLabel.layer.masksToBounds = true
        previewImageView.kf.setImage(with: model.webformatURL?.toURL, placeholder: UIImage(named: "category-placeholder"))
        userImageView.kf.setImage(with: model.userImageURL?.toURL, placeholder: UIImage(named: "user-placeholder"))
        userNameLabel.text = model.user
        tagsLabel.text = "Tags: " + (model.tags ?? "NA").capitalized
     
    }
    
    @IBAction func backAction() {
        dismiss(animated: true)
    }
}
