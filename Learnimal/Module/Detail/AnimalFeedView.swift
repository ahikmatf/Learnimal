//
//  AnimalFeedView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct AnimalFeedView: View {
    var name: String
    @State private var showTabBar = false
    @State private var isFavorite = false
    var model: [FeedModel] = [
        
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0 ..< 10) { post in
                    FeedCell(
                        model: FeedModel(name: nil, imageId: "123123", title: "cristiano ronaldo", subtitle: "animal is fighting with another animal", isFavorite: isFavorite),
                        likeable: true,
                        imageDidDoubleTap: {
                            self.isFavorite.toggle()
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
}

#Preview {
    AnimalFeedView(name: "Cheetah")
}
