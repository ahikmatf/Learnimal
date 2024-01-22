//
//  PersistenceStoreMock.swift
//  LearnimalTests
//
//  Created by Asep Hikmat Fatahillah on 22/01/24.
//

import Foundation
@testable import Learnimal

class PersistenceStoreMock: PersistenceStoreProtocol {
    var animalImagesMock = [AnimalImageViewModel]()
    
    var loadAllFavoriteImagesInvoked = false
    func loadAllFavoriteImages() -> [AnimalImageViewModel] {
        loadAllFavoriteImagesInvoked = true
        return animalImagesMock
    }
    
    var addImageAsFavoriteInvoked = false
    func addImageAsFavorite(model: AnimalImageViewModel) {
        addImageAsFavoriteInvoked = true
        animalImagesMock.append(model)
    }
    
    var removeImageFromFavoriteInvoked = false
    func removeImageFromFavorite(model: AnimalImageViewModel) {
        removeImageFromFavoriteInvoked = true
        if let index = animalImagesMock.firstIndex(where: { $0.id == model.id }) {
            animalImagesMock.remove(at: index)
        }
    }
}
