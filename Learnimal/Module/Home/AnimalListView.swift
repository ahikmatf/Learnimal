//
//  AnimalListView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct AnimalListView: View {
    @State private var showingSheet = false
    
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
                        AnimalCell(showVariance: {
                            showVariance()
                        })
                            .frame(width: width)
                    }
                }
            }
            .navigationTitle("Animal")
            .padding()
            .scrollIndicators(.hidden)
        }
        .sheet(isPresented: $showingSheet) {
            AnimalVarianceSheetView()
        }
    }
    
    private func showVariance() {
        showingSheet.toggle()
    }
}

#Preview {
    AnimalListView()
}
