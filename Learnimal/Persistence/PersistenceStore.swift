//
//  PersistenceStore.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

protocol PersistenceStoreProtocol {
    func loadAllFavoriteImages() -> [AnimalImageViewModel]
    func addImageAsFavorite(model: AnimalImageViewModel)
    func removeImageFromFavorite(model: AnimalImageViewModel)
}

class PersistenceStore: PersistenceStoreProtocol {
    private var favoriteImages = [AnimalImageViewModel]()
    
    static let shared = PersistenceStore()
    init() {}
    
    func loadAllFavoriteImages() -> [AnimalImageViewModel] {
        favoriteImages
    }
    
    func addImageAsFavorite(model: AnimalImageViewModel) {
        favoriteImages.append(model)
    }
    
    func removeImageFromFavorite(model: AnimalImageViewModel) {
        guard let index = favoriteImages.firstIndex(where: { $0.id == model.id }) else { return }
        _ = favoriteImages.remove(at: index)
    }
}
