//
//  ImageViewModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 21/01/24.
//

import Foundation

class AnimalImageViewModel {
    var id: Int
    var name: String
    var imageStringUrl: String
    var photographer: String
    var alt: String
    var isFavorite: Bool
    
    init(name: String, photo: Photo) {
        self.id = photo.id
        self.name = name
        self.imageStringUrl = photo.src?.small ?? ""
        self.photographer = photo.photographer ?? ""
        self.alt = photo.alt ?? ""
        self.isFavorite = false
    }
    
    init(id: Int, name: String, imageStringUrl: String, photographer: String, alt: String, isFavorite: Bool) {
        self.id = -1
        self.name = ""
        self.imageStringUrl = ""
        self.photographer = ""
        self.alt = ""
        self.isFavorite = false
    }

    init(name: String) {
        self.id = -1
        self.name = name
        self.imageStringUrl = ""
        self.photographer = ""
        self.alt = ""
        self.isFavorite = false
    }
    
    func update(with photo: Photo) {
        self.id = photo.id
        self.imageStringUrl = photo.src?.small ?? ""
        self.photographer = photo.photographer ?? ""
        self.alt = photo.alt ?? ""
        self.isFavorite = false
    }
}
