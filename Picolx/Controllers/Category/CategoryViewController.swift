//
//  CategoryViewController.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/1/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit
import Toast_Swift

class CategoryViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Vars
    
    //ViewModel
    let viewModel = CategoryViewModel()
    //Contains the category passed in from the previous controller
    var category: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModelCallbacks()
        viewModel.getCategory(router: CategoryRouter.getPhotosWith(category: category))
    }

    // MARK: - Functions
    
    private func setupUI() {
        collectionView.register(UINib(nibName: CategoryCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.className)
        title = category.capitalized
    }
    
    private func setupViewModelCallbacks() {
        
        //Shows or hides loader and enable/disables the button
        viewModel.displayActivityIndicator = { [weak self] state in
            
            if state {
                self?.view.makeToastActivity(.center)
            } else {
                self?.view.hideToastActivity()
            }
        }
        
        //loads the data
        viewModel.reloadData = { [weak self]  in

            self?.collectionView.reloadData()
        }
        
        //Shows any error message
        viewModel.displayMessage = { [weak self] message in

            self?.view.makeToast(message, duration: 1, position: .center)
        }
    }

}

extension CategoryViewController: UICollectionViewDataSource {
    
    // MARK: - CollectionView Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.className, for: indexPath) as! CategoryCollectionViewCell
        let model = viewModel.itemAtRow(index: indexPath.row)
        cell.setup(viewModel: model)
        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    
    // MARK: - CollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = viewModel.itemAtRow(index: indexPath.row)
        let imagePreviewViewController = ImagePreviewViewController.instantiateViewController()
        imagePreviewViewController.hit = model
        present(imagePreviewViewController, animated: true)
    }
}

extension CategoryViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - CollectionViewFlowLayout Delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.screenSize.width / 3 - 1, height: Constants.screenSize.width / 3 - 1)
    }
}
