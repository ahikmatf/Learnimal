//
//  FavoriteFeedView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct FavoriteFeedView: View {
    @StateObject var viewModel = FavoriteFeedViewModel(store: PersistenceStore.shared)
    @State private var showFilter = false
    @State private var showTabBar = false
    @State private var selectedOption: String? = "show all"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0..<viewModel.favoriteImages.count, id: \.self) { index in
                        let favoriteImage = viewModel.favoriteImages[index]
                        
                        FeedCell(
                            model: FeedModel(name: favoriteImage.name, imageId: "\(favoriteImage.id)", imageStringUrl: favoriteImage.imageStringUrl, title: favoriteImage.photographer, subtitle: favoriteImage.alt, isFavorite: favoriteImage.isFavorite),
                            imageDidDoubleTap: {}
                        )
                    }
                }
                .padding()
            }
            .navigationTitle("Favorite")
            .scrollIndicators(.hidden)
            .toolbar {
                Button {
                    showFilter.toggle()
                } label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
//                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                }
            }
            .sheet(isPresented: $showFilter) {
                FavoriteFilterSheet(filterDidTap: { selectedOption in
                    //
                }, options: ["show all", "cheetah", "fox"], selectedOption: $selectedOption)
            }
        }
        .onAppear {
            viewModel.fetchFavoriteImages()
        }
    }
}

#Preview {
    FavoriteFeedView()
}
