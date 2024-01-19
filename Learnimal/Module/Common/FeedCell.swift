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
}

struct FeedCell: View {
    @State var isFavorite = false
    var model: FeedModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(model.name ?? model.imageId ?? "")
                
                Spacer()
                
                Button(action: {
                    isFavorite.toggle()
                }, label: {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .environment(\.symbolVariants, isFavorite ? .fill : .none)
                })
            }
            
            AsyncImage(url: URL(string: "https://gist.github.com/alienlebarge/605560c2961cb3025038/raw/b75d209134f0fb64f04a5ee9ff274ceabf6e26e8/dodgetocat_v2.png")) { phase in
                switch phase {
                case .empty:
                    ZStack(alignment: .center) {
                        Image(uiImage: UIImage())
                            .resizable()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .background(Color.gray)
                            .onTapGesture(count: 2) {
                                isFavorite.toggle()
                            }
                        
                        ProgressView()
                    }
                case .success(let image):
                    image.resizable()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .onTapGesture(count: 2) {
                            isFavorite.toggle()
                        }
                default:
                    Image(uiImage: UIImage())
                        .resizable()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .background(Color.gray)
                        .onTapGesture(count: 2) {
                            isFavorite.toggle()
                        }
                }
            }
            
            Text(model.title)
            
            Text(model.subtitle)
        }
    }
}

#Preview {
    FeedCell(isFavorite: true, model: FeedModel(name: "the name", imageId: "", title: "critopher colombus", subtitle: "animal is fighing for his life"))
}
