//
//  FavoriteFeedViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import Foundation

class FavoriteFeedViewModel: ObservableObject {
    @Published var filteredFavorites = [AnimalImageViewModel]()
    private var store: PersistenceStoreProtocol
    
    init(store: PersistenceStoreProtocol) {
        self.store = store
    }
    
    func filteredFavoriteImages(query: String) {
        let favoriteImages = store.loadAllFavoriteImages()
        self.filteredFavorites = favoriteImages.filter { image in
            return query == "Show All" ? true : image.name == query
        }
    }
}
