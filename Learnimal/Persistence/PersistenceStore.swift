//
//  PersistenceStore.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

protocol PersistenceStoreProtocol {
    func loadAllFavoriteImages() -> [AnimalImage]
    func addImageAsFavorite(model: AnimalImage)
    func removeImageFromFavorite(model: AnimalImage)
}

class PersistenceStore: PersistenceStoreProtocol {
    private var favoriteImages = [AnimalImage]()
    
    static let shared = PersistenceStore()
    init() {}
    
    func loadAllFavoriteImages() -> [AnimalImage] {
        favoriteImages
    }
    
    func addImageAsFavorite(model: AnimalImage) {
        favoriteImages.append(model)
    }
    
    func removeImageFromFavorite(model: AnimalImage) {
        guard let index = favoriteImages.firstIndex(where: { $0.id == model.id }) else { return }
        _ = favoriteImages.remove(at: index)
    }
}
