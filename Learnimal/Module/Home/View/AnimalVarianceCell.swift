//
//  AnimalVarianceCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 18/01/24.
//

import SwiftUI

struct AnimalVarianceCell: View {
    var model: AnimalVarianceSheetViewModel
    
    var body: some View {
        HStack {
            RemoteImageView(
                imageStringUrl: model.imageStringUrl,
                cornerRadius: 24,
                imageDidDoubleTap: {}
            )
            .frame(width: 128, height: 128)
            
            VStack(alignment: .leading) {
                Text(model.varianceName)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                Text(model.slogan)
                    .font(.footnote)
                    .fontWeight(.medium)
                Text(model.foundAt)
                    .font(.caption)
                Text(model.willPrey)
                    .font(.caption)
            }
            
            Spacer()
        }
        .padding([.leading, .trailing, .bottom])
    }
}

#Preview {
    AnimalVarianceCell(model: .init())
}
