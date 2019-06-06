//
//  PicolxTests.swift
//  PicolxTests
//
//  Created by Aaqib Hussain on 6/1/19.
//  Copyright © 2019 Kode Snippets. All rights reserved.
//

import XCTest
@testable import Picolx

class PicolxTests: XCTestCase {

    var viewModel: CategoryViewModel?
    var requestManager: RequestManagerMock?
    
    override func setUp() {
        requestManager = RequestManagerMock()
        viewModel = CategoryViewModel(requestManager: requestManager!)
    }

    override func tearDown() {
        viewModel = nil
        requestManager = nil
    }

    func testGetCategory() {
        viewModel!.getCategory(router: FileRouter.getNature)
        let first = viewModel?.hits.first
        let last = viewModel?.hits.last
        XCTAssertEqual(first?.largeImageURL, "https://pixabay.com/get/52e2d14a4955af14f6da8c7dda79367c133ad8e150526c48702a72dc954dc550bc_1280.jpg")
        XCTAssertEqual(first?.previewURL, "https://cdn.pixabay.com/photo/2019/06/03/17/33/desert-4249373_150.jpg")
        XCTAssertEqual(first?.downloads, 1991)
        XCTAssertEqual(first?.type, "photo")
        XCTAssertEqual(first?.userImageURL, "https://cdn.pixabay.com/user/2019/04/15/15-57-03-90_250x250.jpg")
        XCTAssertEqual(first?.likes, 49)
        XCTAssertEqual(first?.tags, "desert, pyramids, sand")
        XCTAssertEqual(first?.webformatURL, "https://pixabay.com/get/52e2d14a4955af14f6da8c7dda79367c133ad8e150526c48702a72dc954dc550bc_640.jpg")
        
        
        XCTAssertEqual(last?.largeImageURL, "https://pixabay.com/get/52e2d1404257ac14f6da8c7dda79367c133ad8e150526c48702a72dc954dc550bc_1280.jpg")
        XCTAssertEqual(last?.previewURL, "https://cdn.pixabay.com/photo/2019/06/01/10/37/bee-4243850_150.jpg")
        XCTAssertEqual(last?.downloads, 2400)
        XCTAssertEqual(last?.type, "photo")
        XCTAssertEqual(last?.userImageURL, "https://cdn.pixabay.com/user/2019/05/25/02-43-52-985_250x250.jpg")
        XCTAssertEqual(last?.likes, 52)
        XCTAssertEqual(last?.tags, "bee, insect, animal")
        XCTAssertEqual(last?.webformatURL, "https://pixabay.com/get/52e2d1404257ac14f6da8c7dda79367c133ad8e150526c48702a72dc954dc550bc_640.jpg")
        
        
        XCTAssertEqual(viewModel?.hits.count, 20)
    }
    
    func testItemAtRow() {
        viewModel!.getCategory(router: FileRouter.getNature)
        let first = viewModel?.hits.first
        let firstFromMethod = viewModel?.itemAtRow(index: 0)
        
        XCTAssertEqual(first?.largeImageURL, firstFromMethod?.largeImageURL)
        XCTAssertEqual(first?.previewURL, firstFromMethod?.previewURL)
        XCTAssertEqual(first?.downloads, firstFromMethod?.downloads)
        XCTAssertEqual(first?.type, firstFromMethod?.type)
        XCTAssertEqual(first?.userImageURL, firstFromMethod?.userImageURL)
        XCTAssertEqual(first?.likes, firstFromMethod?.likes)
        XCTAssertEqual(first?.tags, firstFromMethod?.tags)
        XCTAssertEqual(first?.webformatURL, firstFromMethod?.webformatURL)
    }

}
