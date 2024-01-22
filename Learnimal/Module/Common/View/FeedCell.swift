//
//  FeedCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct FeedCell: View {
    var model: FeedModel
    var likeable = false
    var imageDidDoubleTap: () -> Void
    @State private var favoriteAnimation = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(model.name) (\(model.imageId))")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: {
                    self.imageDidDoubleTap()
                }, label: {
                    Image(systemName: model.isFavorite ? "star.fill" : "star")
                        .environment(\.symbolVariants, model.isFavorite ? .fill : .none)
                })
            }
            
            ZStack {
                RemoteImageView(
                    imageStringUrl: model.imageStringUrl,
                    cornerRadius: 24,
                    imageDidDoubleTap: {
                        self.imageDidDoubleTap()
                        
                        if likeable {
                            withAnimation {
                                self.favoriteAnimation.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    self.favoriteAnimation.toggle()
                                }
                            }
                        }
                    }
                )
                
                if favoriteAnimation {
                    Image(systemName: model.isFavorite ? "star.fill" : "star")
                        .resizable()
                        .frame(width: 128, height: 128)
                        .transition(.opacity)
                        .shadow(color: .white, radius: 20)
                }
            }
            
            Text(model.title)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(model.subtitle)
                .font(.caption)
            
            Divider()
                .padding(.vertical)
        }
    }
}

#Preview {
    FeedCell(
        model: FeedModel(imageViewModel: .init(id: 123, name: "Animal", imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000360.jpg", photographer: "Peter Parker", alt: "Knowing is believing the things", isFavorite: true)),
        imageDidDoubleTap: {}
    )
}
