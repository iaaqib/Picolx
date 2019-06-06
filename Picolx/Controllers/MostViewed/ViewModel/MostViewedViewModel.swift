//
//  MostViewedViewModel.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/6/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class MostViewedViewModel {

    // MARK: - Vars
   
    //CoreData handler
    private var coreDataManager: CoreDataManager
    //To give callbacks to ViewController
    var mostViewCategoryName: (_ name: String) -> ()
    
    // MARK: - Init
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
        mostViewCategoryName = { _ in }
    }
    
    // MARK: - Function
    
    func mostViewed() {
        guard let category = coreDataManager.mostViewedCategories.first else { return }
        mostViewCategoryName(category.name ?? "")
    }
}
