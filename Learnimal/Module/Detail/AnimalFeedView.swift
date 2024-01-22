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
                    let animalImage = viewModel.animalImages[index]
                    
                    FeedCell(
                        model: FeedModel(imageViewModel: animalImage),
                        likeable: true,
                        imageDidDoubleTap: {
                            imageDidDoubleTap(isFavorite: !animalImage.isFavorite, model: animalImage)
                        }
                    )
                }
            }
            .padding()
        }
        .onAppear {
            showTabBar = false
            viewModel.fetchAnimalImages(name: name) {
                viewModel.markFavoriteImages()
            }
        }
        .onDisappear { showTabBar = true }
        .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
    }
    
    func imageDidDoubleTap(isFavorite: Bool, model: AnimalImageViewModel) {
        viewModel.imageDidDoubleTap(isFavorite: isFavorite, model: model)
    }
}

#Preview {
    AnimalFeedView(name: "Cheetah")
}
