//
//  FavoriteFeedViewModelTests.swift
//  LearnimalTests
//
//  Created by Asep Hikmat Fatahillah on 22/01/24.
//

import Foundation
@testable import Learnimal
import XCTest

class FavoriteFeedViewModelTests: XCTestCase {
    var persistenceStoreMock: PersistenceStoreMock!
    var viewModel: FavoriteFeedViewModel!
    
    override func setUp() {
        super.setUp()
        persistenceStoreMock = PersistenceStoreMock()
        viewModel = FavoriteFeedViewModel(store: persistenceStoreMock)
    }
    
    override func tearDown() {
        super.tearDown()
        persistenceStoreMock = nil
        viewModel = nil
    }
    
    func test_loadDataWithoutFiltering_showSameCount() {
        persistenceStoreMock.animalImagesMock.append(.init(id: 1, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 2, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 3, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 4, name: "motor"))
        
        viewModel.filteredFavoriteImages(query: "Show All")
        
        XCTAssertEqual(viewModel.filteredFavorites.count, 4)
    }
    
    func test_loadDataWithFiltering_showSameCount() {
        persistenceStoreMock.animalImagesMock.append(.init(id: 1, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 2, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 3, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 4, name: "motor"))
        
        viewModel.filteredFavoriteImages(query: "car")
        
        XCTAssertEqual(viewModel.filteredFavorites.count, 3)
    }
    
    func test_loadDataWithFiltering_dataNotExist_showSameCount() {
        persistenceStoreMock.animalImagesMock.append(.init(id: 1, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 2, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 3, name: "car"))
        persistenceStoreMock.animalImagesMock.append(.init(id: 4, name: "motor"))
        
        viewModel.filteredFavoriteImages(query: "fox")
        
        XCTAssertEqual(viewModel.filteredFavorites.count, 0)
    }
}
