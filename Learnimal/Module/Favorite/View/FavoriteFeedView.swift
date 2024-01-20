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
    @State private var selectedOption: String = "Show All"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    let data = viewModel.filteredFavoriteImages(query: selectedOption)
                    ForEach(0..<data.count, id: \.self) { index in
                        let favoriteImage = data[index]
                        
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
                    Image(systemName: selectedOption == "Show All" ? "line.3.horizontal.decrease.circle" : "line.3.horizontal.decrease.circle.fill")
                }
            }
            .sheet(isPresented: $showFilter) {
                FavoriteFilterSheet(filterDidTap: { selectedOption in
                    
                }, selectedOption: $selectedOption)
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
