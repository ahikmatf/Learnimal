//
//  FeedModel.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 22/01/24.
//

import Foundation

struct FeedModel {
    let name: String
    let imageId: String
    let imageStringUrl: String
    let title: String
    let subtitle: String
    let isFavorite: Bool
    
    init(imageViewModel: AnimalImageViewModel) {
        self.name = imageViewModel.name
        self.imageId = "\(imageViewModel.id)"
        self.imageStringUrl = imageViewModel.imageStringUrl
        self.title = imageViewModel.photographer
        self.subtitle = imageViewModel.alt
        self.isFavorite = imageViewModel.isFavorite
    }
}
