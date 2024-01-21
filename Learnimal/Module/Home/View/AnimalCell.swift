//
//  AnimalCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct AnimalCell: View {
    var model: AnimalImageViewModel
    var showVariance: (String) -> Void
    
    private let width = (UIScreen.main.bounds.width / 2) - 24
    
    var body: some View {
        VStack(alignment: .center) {
            RemoteImageView(
                imageStringUrl: model.imageStringUrl,
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
    AnimalCell(model: .init(name: "name"), showVariance: {_ in })
}
