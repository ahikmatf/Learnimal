//
//  FavoriteFeedView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct FavoriteFeedView: View {
    @State private var showTabBar = false
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0 ..< 10) { post in
                    FeedCell(isFavorite: post % 2 == 0, model: FeedModel(name: "whale", stringId: nil, title: "cristiano ronaldo", subtitle: "animal is fighting with another animal"))
                    
                    Divider()
                        .padding(.vertical)
                }
            }
            .padding()
        }
        .navigationTitle("Favorite")
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    FavoriteFeedView()
}
