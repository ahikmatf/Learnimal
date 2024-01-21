//
//  FavoriteFeedViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

class FavoriteFeedViewModel: ObservableObject {
    @Published var favoriteImages = [AnimalImageViewModel]()
    private var store: PersistenceStoreProtocol
    
    init(store: PersistenceStoreProtocol) {
        self.store = store
    }
    
    func filteredFavoriteImages(query: String) -> [AnimalImageViewModel] {
        if query == "Show All" {
            return favoriteImages
        } else {
            return favoriteImages.filter { $0.name == query }
        }
    }
    
func fetchFavoriteImages() {
        favoriteImages = store.loadAllFavoriteImages()
    }
}
