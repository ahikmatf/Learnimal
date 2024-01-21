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
    
    init(store: PersistenceStoreProtocol) {
        self.store = store
    }
    
    func fetchAnimalImages(name: String) {
        self.animalImages = [
            .init(id: IdGenerator.generate(index: 0, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000014.jpg", photographer: "Clover Master", alt: "Amazing animals that braining", isFavorite: false),
            .init(id: IdGenerator.generate(index: 1, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000022.jpg", photographer: "Peter Parker", alt: "Never hear before?", isFavorite: false),
            .init(id: IdGenerator.generate(index: 2, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000055.jpg", photographer: "Alexander Grock", alt: "Lion that can climb a tree", isFavorite: false),
            .init(id: IdGenerator.generate(index: 3, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000069.jpg", photographer: "Lunox Liousein", alt: "We never see dinosuar ever again", isFavorite: false),
            .init(id: IdGenerator.generate(index: 4, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000109.jpg", photographer: "Claude Dexter", alt: "Long tail is inevitable for this animal", isFavorite: false),
            .init(id: IdGenerator.generate(index: 5, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000148.jpg", photographer: "Popol Kupa", alt: "We used to feel that sharks are big", isFavorite: false),
            .init(id: IdGenerator.generate(index: 6, name: name), name: name, imageStringUrl: "Eleanor Rigby", photographer: "Never lost yourself in forest", alt: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000210.jpg", isFavorite: false),
            .init(id: IdGenerator.generate(index: 7, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000357.jpg", photographer: "Peter Crouch", alt: "Always take a look before you sit in Australia", isFavorite: false),
            .init(id: IdGenerator.generate(index: 8, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/B001253.jpg", photographer: "Oligarchy Monarchy", alt: "That spider who always sleep", isFavorite: false),
            .init(id: IdGenerator.generate(index: 9, name: name), name: name, imageStringUrl: "Bush Tigreal", photographer: "Bite is it's middle name", alt: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000360.jpg", isFavorite: false),
            .init(id: IdGenerator.generate(index: 10, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000361.jpg", photographer: "Carmilla Cecilion", alt: "Over here, over there, and it's over", isFavorite: false),
            .init(id: IdGenerator.generate(index: 11, name: name), name: name, imageStringUrl: "Yu Zhong Chou", photographer: "Big brain slow move", alt: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000362.jpg", isFavorite: false),
            .init(id: IdGenerator.generate(index: 12, name: name), name: name, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000364.jpg", photographer: "Gusion Harley", alt: "No wonder this animal last forever", isFavorite: false)
        ]
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
        if isFavorite {
            addImageAsFavorite(model: model)
        } else {
            removeImageFromFavorite(model: model)
        }
    }
    
    private func addImageAsFavorite(model: AnimalImageViewModel) {
        store.addImageAsFavorite(model: model)
    }
    
    private func removeImageFromFavorite(model: AnimalImageViewModel) {
        store.removeImageFromFavorite(model: model)
    }
}
