//
//  CategorySelectionViewController.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/2/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class CategorySelectionViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Var
    
    //ViewModel
    let categorySelectionViewModel = CategorySelectionViewModel()
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: - Function
    
    private func setupUI() {
        navigationItem.setHidesBackButton(true, animated: false)
        collectionView.register(UINib(nibName: CategoryCollectionViewCell.className, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.className)
    }
    
}

extension CategorySelectionViewController: UICollectionViewDataSource {
    
    // MARK: - CollectionView Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorySelectionViewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.className, for: indexPath) as! CategoryCollectionViewCell
        let category = categorySelectionViewModel.itemAtRow(index: indexPath.row)
        let tap = categorySelectionViewModel.viewsOnCategories[indexPath.row]
        cell.showCategory(category: category, views: tap.toString)
        
        return cell
    }
}

extension CategorySelectionViewController: UICollectionViewDelegate {
    
    // MARK: - CollectionView Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryViewController = CategoryViewController.instantiateViewController()
        let item = categorySelectionViewModel.itemAtRow(index: indexPath.row)
        categorySelectionViewModel.didSelect(categoryName: item)
        categoryViewController.category = item
        navigationController?.pushViewController(categoryViewController, animated: true)
    }
}

extension CategorySelectionViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - CollectionViewFlowLayout Delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = categorySelectionViewModel.widths[indexPath.row]
        return CGSize(width: width, height: categorySelectionViewModel.height)
    }
    
    
}
