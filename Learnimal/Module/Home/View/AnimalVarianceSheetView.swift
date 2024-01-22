//
//  AnimalVarianceSheetView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct AnimalVarianceSheetView: View {
    var name: String
    var viewModels: [AnimalVarianceSheetViewModel]
    @Binding var isLoading: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            VStack {
                Text("\(name)'s Variance")
                    .font(.title2)
                    .padding(.vertical)
                
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(0..<viewModels.count, id:\.self) { index in
                            let model = viewModels[index]
                            AnimalVarianceCell(model: model)
                        }
                    }
                }
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Dismiss")
                        .frame(maxWidth: .infinity)
                        .padding([.vertical])
                        .background(Color.yellow)
                })
            }
            .opacity(isLoading ? 0 : 1)
            
            ProgressView()
                .opacity(isLoading ? 1 : 0)
        }
    }
}

#Preview {
    AnimalVarianceSheetView(name: "Elephant", viewModels: [], isLoading: .constant(false))
}
