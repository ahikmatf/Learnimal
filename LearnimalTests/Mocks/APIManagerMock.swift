//
//  APIManagerMock.swift
//  LearnimalTests
//
//  Created by Asep Hikmat Fatahillah on 22/01/24.
//

import Foundation
@testable import Learnimal

class APIManagerMock: APIManagerProtocol {
    var variancesSheetViewModel: [AnimalVarianceSheetViewModel] = []
    var animalImagesViewModel: [AnimalImageViewModel] = []
    
    var fetchAnimalVarianceInvoked = false
    func fetchAnimalVariance(name: String, completion: @escaping (Bool) -> Void) {
        fetchAnimalVarianceInvoked = true
        completion(true)
    }
    
    var fetchAnimalImageInvoked = false
    func fetchAnimalImage(query: String, count: Int, completion: @escaping ([AnimalImageViewModel]) -> Void) {
        fetchAnimalImageInvoked = true
        completion([])
    }
}
