//
//  AnimalFeedView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct AnimalFeedView: View {
    var name: String
    @StateObject var viewModel = AnimalFeedViewModel(store: PersistenceStore.shared)
    @State private var showTabBar = false
    @State private var isFavorite = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0..<viewModel.animalImages.count, id: \.self) { index in
                    var animalImage = viewModel.animalImages[index]
                    
                    FeedCell(
                        model: FeedModel(name: nil, imageId: "\(animalImage.id)", imageStringUrl: animalImage.imageStringUrl, title: animalImage.photographer, subtitle: animalImage.alt, isFavorite: animalImage.isFavorite),
                        likeable: true,
                        imageDidDoubleTap: {
                            animalImage.isFavorite.toggle()
                            imageDidDoubleTap(isFavorite: animalImage.isFavorite, model: animalImage)
                            viewModel.animalImages[index].isFavorite = animalImage.isFavorite
                        }
                    )
                }
            }
            .padding()
        }
        .onAppear { showTabBar = false }
        .onDisappear { showTabBar = true }
        .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
    }
    
    func imageDidDoubleTap(isFavorite: Bool, model: AnimalImage) {
        viewModel.imageDidDoubleTap(isFavorite: isFavorite, model: model)
    }
}

#Preview {
    AnimalFeedView(name: "Cheetah")
}
