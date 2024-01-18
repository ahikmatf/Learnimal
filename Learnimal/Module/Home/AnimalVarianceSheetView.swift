//
//  AnimalVarianceSheetView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct AnimalVarianceSheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Cheetah's Variance")
                .font(.title2)
                .padding(.vertical)
            
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(0 ..< 10) { variance in
                        AnimalVarianceCell()
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
    AnimalVarianceSheetView()
}
