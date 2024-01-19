//
//  HomeAnimalView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct HomeAnimalView: View {
    @State private var showSheet = false
    @StateObject var viewModel = HomeAnimalViewModel()
    
    private let width = (UIScreen.main.bounds.width / 2) - 32
    private let items = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: items) {
                    ForEach(viewModel.animals) { animal in
                        NavigationLink {
                            AnimalFeedView(name: "\(animal.name)")
                        } label: {
                            AnimalCell(model: animal, showVariance: { showVariance() })
                                .frame(width: width)
                                .id(animal.id)
                                .tint(.black)
                        }
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
