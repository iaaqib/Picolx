//
//  CategorySelectionViewModel.swift
//  Picolx
//
//  Created by Aaqib Hussain on 6/4/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import UIKit

class CategorySelectionViewModel {
    
    // MARK: - Vars
    
    private(set) var categoryNames: [String : Int32] = [:]
    private let keys = ["fashion", "nature", "backgrounds", "science", "education", "people"]
    //CoreData Handler
    private var coreDataManager: CoreDataManager
    //Contains the widths of each cell
    private(set) var widths: [CGFloat] = []
    //1/3 of the screen width taken as height
    private(set) var height: CGFloat = Constants.screenSize.width / 3
    //For keeping track of views
    private(set) var categoryViews: [String : Int32] = [:]
    private(set) var viewsOnCategories: [Int32] = []
    
    var mostViewedCategories: [Category] {
        return coreDataManager.mostViewedCategories
    }
    var numberOfRows: Int {
        return keys.count
    }
    
    // MARK: - Init
    
    init(coreDataManager: CoreDataManager = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
        createCategoryData()
    }
    
    // MARK: - Functions
    
    func didSelect(categoryName: String) {
        coreDataManager.saveCategory(categoryName: categoryName)
        createCategoryData()
    }
    
    private func createCategoryData() {
        limitToMaxOfTwo()
        createWidths()
    }
    
    private func limitToMaxOfTwo() {
        categoryViews = categoryNames
        categoryNames = ["fashion" : 0, "nature" : 0, "backgrounds" : 0, "science" : 0, "education" : 0, "people" : 0]
        //If mostViewedCategories is zero then return a count of 0 otherwise if its greator than 1 return 2 otherwise 1.
        let count = mostViewedCategories.count == 0 ? 0 : mostViewedCategories.count > 1 ? 2 : 1
        //Update the categoryNames dictionary with the two most viewed tap counts
        for index in 0..<count {
            let category = mostViewedCategories[index]
            categoryNames[category.name ?? ""] = category.hasFavorites?.tapCount
        }
        
        //Updating the views of categories
        mostViewedCategories.forEach { (category) in
            categoryViews[category.name ?? ""] = category.hasFavorites?.tapCount
        }
    }
    
    private func createWidths() {
        //Create an array of tap counts in the order of the keys that are present
        let taps = keys.map{ categoryNames[$0] ?? 0 }
        self.viewsOnCategories = keys.map{categoryViews[$0] ?? 0}
        let dimensions = getWidth(taps: taps)
        widths = dimensions
    }
    
    func getWidth(taps: [Int32]) -> [CGFloat] {
        var widths: [CGFloat] = []
        let widthOfOneCell =  height
        let widthOfTwoCell = widthOfOneCell * 2
        let widthOfThreeCell = widthOfOneCell * 3
        var width: CGFloat = widthOfOneCell
        //Taps will only take effect if clicked 3 or more than 3 times.
        taps.forEach { (tap) in
            if tap >= 3 && tap < 7 {
                width = widthOfTwoCell
                widths.append(width)
            } else if tap >= 7 {
                width = widthOfThreeCell
                widths.append(width)
            } else {
                width = widthOfOneCell
                widths.append(width)
            }
        }
        return widths
    }
    
    func itemAtRow(index: Int) -> String {
        return keys[index]
    }
    
}
