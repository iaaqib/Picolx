//
//  SplashViewModel.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/6/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class SplashViewModel {
    
    // MARK: - Vars
    
    //CoreData handler
    private var coreDataManager: CoreDataManager
    //If mostviewed exists or not
    var isMostViewed: Bool {
        return coreDataManager.mostViewedCategories.count > 0
    }
    
    // MARK: - Init
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }

    
}
