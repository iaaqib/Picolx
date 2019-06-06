//
//  CategoryViewModel.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/2/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class CategoryViewModel: NSObject {

    // MARK: - Vars
    
    private let requestManager: RequestManager
    private(set) var hits: [Hit] = []
    private(set) var category: CategoryModel? = nil
    
    //To give callbacks to ViewController
    var displayActivityIndicator: (_ status: Bool) -> ()
    var displayMessage: (_ message: String) -> ()
    var reloadData: () -> ()
    
    var numberOfRows: Int {
        return hits.count
    }
    
    init(requestManager: RequestManager = RequestManager()) {
        self.requestManager = requestManager
        displayActivityIndicator = { _ in }
        displayMessage = { _ in }
        reloadData = { }
    }
    
    // MARK: - Functions
    
    func getCategory(router: Router) {
        displayActivityIndicator(true)
        requestManager.request(router: router) { [weak self] (response: Result<CategoryModel, Error>) in
            switch response {
            case .success(let category):
                self?.displayActivityIndicator(false)
                self?.category = category
                guard let hits = self?.category?.hits else { return }
                self?.hits = hits
                self?.reloadData()
                break
            case .failure(let error):
                self?.displayMessage(error.localizedDescription)
                self?.displayActivityIndicator(false)
                break
            }
        }
    }
    
    func itemAtRow(index: Int) -> Hit {
        return hits[index]
    }
    
}
