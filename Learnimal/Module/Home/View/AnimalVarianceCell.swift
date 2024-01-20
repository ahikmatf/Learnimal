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
                imageStringUrl: "https://gist.github.com/alienlebarge/605560c2961cb3025038/raw/b75d209134f0fb64f04a5ee9ff274ceabf6e26e8/dodgetocat_v2.png",
                cornerRadius: 24,
                imageDidDoubleTap: {}
            )
            .frame(width: 128, height: 128)
            
            VStack(alignment: .leading) {
                Text(model.varianceName)
                    .fontWeight(.semibold)
                    .font(.subheadline)
                Text(model.slogan)
                    .font(.caption)
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
