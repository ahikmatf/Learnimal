//
//  FavoriteFeedViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

class FavoriteFeedViewModel: ObservableObject {
    @Published var favoriteImages = [AnimalImage]()
    private var store: PersistenceStoreProtocol
    
    init(store: PersistenceStoreProtocol) {
        self.store = store
    }
    
    func fetchFavoriteImages() {
        favoriteImages = store.loadAllFavoriteImages()
    }
}
