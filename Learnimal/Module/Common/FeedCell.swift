//
//  FeedCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 17/01/24.
//

import SwiftUI

struct FeedModel {
    let name: String?
    let imageId: String?
    let title: String
    let subtitle: String
    let isFavorite: Bool
}

struct FeedCell: View {
    var model: FeedModel
    var likeable = false
    var imageDidDoubleTap: () -> Void
    @State private var favoriteAnimation = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(model.name ?? model.imageId ?? "")
                
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
                    imageStringUrl: "https://gist.github.com/alienlebarge/605560c2961cb3025038/raw/b75d209134f0fb64f04a5ee9ff274ceabf6e26e8/dodgetocat_v2.png",
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
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 128, height: 128)
                    //                                .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .transition(.opacity)
                        .opacity(favoriteAnimation ? 1 : 0)
                }
            }
            
            Text(model.title)
            
            Text(model.subtitle)
            
            Divider()
                .padding(.vertical)
        }
    }
}

#Preview {
    FeedCell(
        model: FeedModel(name: "the name", imageId: "", title: "critopher colombus", subtitle: "animal is fighing for his life", isFavorite: true),
        imageDidDoubleTap: {}
    )
}
