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
            AnimalListView()
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "cat.fill" : "cat")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Animal")
                    }
                }
            
            Text("Favorite List")
                .tabItem {
                    VStack {
                        Image(systemName: selectedTab == 0 ? "star.fill" : "star")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Favorite")
                    }
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
