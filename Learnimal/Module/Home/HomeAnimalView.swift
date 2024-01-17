//
//  HomeAnimalView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct HomeAnimalView: View {
    @State private var showSheet = false
    
    private let width = (UIScreen.main.bounds.width / 2) - 32
    private let items = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: items) {
                    ForEach(0..<8) { animal in
                        NavigationLink {
                            AnimalFeedView(name: "animal \(animal)")
                        } label: {
                            AnimalCell(showVariance: {
                                showVariance()
                            })
                            .frame(width: width)
                        }
                        .tint(.black)
                    }
                }
            }
            .navigationTitle("Animal")
            .padding()
            .scrollIndicators(.hidden)
        }
        .sheet(isPresented: $showSheet) {
            AnimalVarianceSheetView()
        }
    }
    
    private func showVariance() {
        showSheet.toggle()
    }
}

#Preview {
    HomeAnimalView()
}
