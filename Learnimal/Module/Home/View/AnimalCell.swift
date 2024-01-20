//
//  AnimalCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct AnimalCell: View {
    var model: Animal
    var showVariance: (String) -> Void
    
    private let width = (UIScreen.main.bounds.width / 2) - 24
    
    var body: some View {
        VStack(alignment: .center) {
            RemoteImageView(
                filename: model.filename,
                imageStringUrl: "https://gist.github.com/alienlebarge/605560c2961cb3025038/raw/b75d209134f0fb64f04a5ee9ff274ceabf6e26e8/dodgetocat_v2.png",
                cornerRadius: 24,
                imageDidDoubleTap: {}
            )
            
            HStack {
                Text(model.name)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    showVariance(model.name)
                }, label: {
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .tint(.black)
                        .frame(width: 16, height: 16)
                })
            }
        }
    }
}

#Preview {
    AnimalCell(model: Animal(id: "123", name: "Elephant", filename: "animal-fox"), showVariance: { _ in })
}
