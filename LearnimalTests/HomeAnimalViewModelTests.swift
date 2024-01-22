//
//  HomeAnimalViewModelTests.swift
//  LearnimalTests
//
//  Created by Asep Hikmat Fatahillah on 22/01/24.
//

import Foundation
@testable import Learnimal
import XCTest

class HomeAnimalViewModelTests: XCTestCase {
    var apiManagerMock: APIManagerMock!
    var viewModel: HomeAnimalViewModel!
    
    override func setUp() {
        super.setUp()
        apiManagerMock = APIManagerMock()
        viewModel = HomeAnimalViewModel(apiManager: apiManagerMock)
    }
    
    override func tearDown() {
        super.tearDown()
        apiManagerMock = nil
        viewModel = nil
    }
    
    func test_fetchAnimalVariance_apiInvoked() {
        viewModel.fetchAnimalVariance(name: "animal") { isSuccess in
            XCTAssertTrue(isSuccess)
            XCTAssertTrue(self.apiManagerMock.fetchAnimalVarianceInvoked)
        }
    }
}
