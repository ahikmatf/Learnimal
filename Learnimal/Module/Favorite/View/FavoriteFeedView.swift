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
                    ForEach(0 ..< viewModel.filteredFavorites.count, id: \.self) { index in
                        let favoriteImage = viewModel.filteredFavorites[index]
                        
                        FeedCell(
                            model: FeedModel(imageViewModel: favoriteImage),
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
                    viewModel.filteredFavoriteImages(query: selectedOption)
                }, selectedOption: $selectedOption)
            }
            .onAppear {
                viewModel.filteredFavoriteImages(query: selectedOption)
            }
        }
    }
}

#Preview {
    FavoriteFeedView()
}
