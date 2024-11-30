//
//  RecipeViewerTests.swift
//  RecipeViewerTests
//
//  Created by Mikhail Kolkov on 11/29/24.
//

import XCTest
@testable import RecipeViewer

final class RecipeViewerTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Test fetching mock recipes
    func testFetchMockRecipes() {
        let mockService = RecipeMockService()
        mockService.getMockData { result in
            switch result {
            case .success(let recipes):
                XCTAssertEqual(recipes.count, 63)
            case .failure(let failure):
                XCTFail("Error: \(failure.info)")
            }
        }
    }
    
    // Test fetching mock empty recipes
    func testFetchMockEmptyRecipes() {
        let mockService = RecipeMockService()
        mockService.getMockEmptyData { result in
            switch result {
            case .success(let recipes):
                XCTAssertEqual(recipes.isEmpty, true)
            case .failure(let failure):
                XCTFail("Error: \(failure.info)")
            }
        }
    }
    
    // Testing fetching mock invalid recipes
    func testFetchMockInvalidRecipes() {
        let mockService = RecipeMockService()
        mockService.getMockInvalidData { result in
            switch result {
            case .success(let recipes):
                XCTAssertEqual(recipes.isEmpty, true)
            case .failure(let failure):
                XCTAssertEqual(failure, .invalidData)
            }
        }
    }
}
