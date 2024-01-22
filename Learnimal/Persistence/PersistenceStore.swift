//
//  PersistenceStore.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 20/01/24.
//

import SwiftUI
import CoreData

protocol PersistenceStoreProtocol {
    func loadAllFavoriteImages() -> [AnimalImageViewModel]
    func addImageAsFavorite(model: AnimalImageViewModel)
    func removeImageFromFavorite(model: AnimalImageViewModel)
}

class PersistenceStore: PersistenceStoreProtocol {
    private var viewContext = PersistenceController.shared.container.viewContext
    
    static let shared = PersistenceStore()
    init() {}
    
    func loadAllFavoriteImages() -> [AnimalImageViewModel] {
        let favoriteImagesMO = try? viewContext.fetch(NSFetchRequest<AnimalImageMO>(entityName: "AnimalImageMO"))
        var favImage = [AnimalImageViewModel]()
        favoriteImagesMO?.forEach({ mo in
            favImage.append(AnimalImageViewModel(animalImagesMO: mo))
        })
        
        return favImage
    }
    
    func addImageAsFavorite(model: AnimalImageViewModel) {
        let animalImageMO = AnimalImageMO(context: viewContext)
        animalImageMO.save(imageViewModel: model)
        try? viewContext.save()
    }
    
    func removeImageFromFavorite(model: AnimalImageViewModel) {
        let  fetchRequest = NSFetchRequest<AnimalImageMO>(entityName: "AnimalImageMO")
        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(model.id)")
        let results = try? viewContext.fetch(fetchRequest)
        guard let obj = results?.first else { return }
        viewContext.delete(obj)
        try? viewContext.save()
    }
}

extension AnimalImageMO {
    func save(imageViewModel: AnimalImageViewModel) {
        id = Int32(imageViewModel.id)
        name = imageViewModel.name
        imageStringUrl = imageViewModel.imageStringUrl
        photographer = imageViewModel.photographer
        alt = imageViewModel.alt
        isFavorite = imageViewModel.isFavorite
    }
}

extension AnimalImageViewModel {
    init(animalImagesMO: AnimalImageMO) {
        self.id = Int(animalImagesMO.id)
        self.name = animalImagesMO.name ?? ""
        self.imageStringUrl = animalImagesMO.imageStringUrl ?? ""
        self.photographer = animalImagesMO.photographer ?? ""
        self.alt = animalImagesMO.alt ?? ""
        self.isFavorite = animalImagesMO.isFavorite == true
    }
}
