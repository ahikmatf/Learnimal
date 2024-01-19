//
//  FavoriteFeedView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct FavoriteFeedView: View {
    @State private var showFilter = false
    @State private var showTabBar = false
    @State private var selectedOption: String? = "show all"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0 ..< 10) { post in
                        FeedCell(
                            model: FeedModel(name: "whale", imageId: nil, title: "cristiano ronaldo", subtitle: "animal is fighting with another animal", isFavorite: true),
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
    }
}

#Preview {
    FavoriteFeedView()
}
