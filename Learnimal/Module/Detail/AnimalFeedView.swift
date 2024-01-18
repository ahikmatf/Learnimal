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
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(0 ..< 10) { post in
                    FeedCell(isFavorite: post % 2 == 0, model: FeedModel(name: nil, imageId: "123123", title: "cristiano ronaldo", subtitle: "animal is fighting with another animal"))
                    
                    Divider()
                        .padding(.vertical)
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
