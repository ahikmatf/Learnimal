//
//  AnimalCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 16/01/24.
//

import SwiftUI

struct AnimalCell: View {
    var showVariance: () -> Void
    
    private let width = (UIScreen.main.bounds.width / 2) - 24
    
    var body: some View {
        VStack(alignment: .center) {
            Image(uiImage: UIImage())
                .resizable()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .background(Color.gray)
            
            HStack {
                Text("Animal Name")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    showVariance()
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
    AnimalCell {
        //
    }
}
