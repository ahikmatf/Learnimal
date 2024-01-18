//
//  AnimalVarianceCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 18/01/24.
//

import SwiftUI

struct AnimalVarianceCell: View {
    var body: some View {
        HStack {
            Image(uiImage: UIImage())
                .frame(width: 128, height: 128)
                .background(Color.red)
            
            VStack(alignment: .leading) {
                Text("Animal name")
                Text("Slogan")
                Text("Found in")
                Text("Will Prey")
            }
            
            Spacer()
        }
        .padding([.leading, .trailing, .bottom])
    }
}

#Preview {
    AnimalVarianceCell()
}
