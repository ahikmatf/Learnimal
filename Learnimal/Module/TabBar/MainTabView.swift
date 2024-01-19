//
//  MainTabView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeAnimalView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "cat.fill" : "cat")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Animal")
                    }
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            FavoriteFeedView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 1 ? "star.fill" : "star")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Favorite")
                    }
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
