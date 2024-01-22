//
//  AnimalFeedViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 19/01/24.
//

import Foundation

class AnimalFeedViewModel: ObservableObject {
    @Published var animalImages = [AnimalImageViewModel]()
    private var store: PersistenceStoreProtocol
    private let apiManager: APIManager = APIManager()
    
    init(store: PersistenceStoreProtocol) {
        self.store = store
    }
    
    func fetchAnimalImages(name: String, completion: @escaping () -> Void) {
        apiManager.fetchAnimalImage(query: name, count: 7) { viewModels in
            self.animalImages = viewModels
            completion()
        }
    }
    
    func markFavoriteImages() {
        let favoriteImages = store.loadAllFavoriteImages()
        animalImages = animalImages.map { animalImage in
            var model = animalImage
            if let _ = favoriteImages.first(where: { $0.id == model.id }) {
                model.isFavorite = true
            }
            
            return model
        }
    }
    
    func imageDidDoubleTap(isFavorite: Bool, model: AnimalImageViewModel) {
        guard let updatedModel = updateFavoriteStatus(for: model, isFavorite: isFavorite) else { return }
        
        if isFavorite {
            addImageAsFavorite(model: updatedModel)
        } else {
            removeImageFromFavorite(model: updatedModel)
        }
    }
    
    private func updateFavoriteStatus(for model: AnimalImageViewModel, isFavorite: Bool) -> AnimalImageViewModel? {
        if let index = animalImages.firstIndex(where: { $0.id == model.id }) {
            animalImages[index].isFavorite = isFavorite
            return animalImages[index]
        }
        return nil
    }
    
    private func addImageAsFavorite(model: AnimalImageViewModel) {
        store.addImageAsFavorite(model: model)
    }
    
    private func removeImageFromFavorite(model: AnimalImageViewModel) {
        store.removeImageFromFavorite(model: model)
    }
}
