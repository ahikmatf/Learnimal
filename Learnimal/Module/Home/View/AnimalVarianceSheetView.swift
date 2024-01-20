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
    @Environment(\.dismiss) var dismiss

    var body: some View {
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
    }
}

#Preview {
    AnimalVarianceSheetView(name: "Elephant", viewModels: [])
}
