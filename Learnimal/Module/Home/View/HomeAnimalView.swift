//
//  HomeAnimalView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct HomeAnimalView: View {
    @StateObject var viewModel = HomeAnimalViewModel()
    @State private var showSheet = false
    @State private var animalSelected: String = ""
    
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
                            AnimalCell(model: animal, showVariance: { name in
                                showVariance(name: name)
                            })
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
            AnimalVarianceSheetView(name: animalSelected, viewModels: viewModel.variancesSheetViewModel)
        }
    }
    
    private func showVariance(name: String) {
        animalSelected = name
        viewModel.fetchAnimalVariance(name: name) { _ in
            showSheet.toggle()
        }
    }
}

#Preview {
    HomeAnimalView()
}
