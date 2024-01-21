//
//  RemoteImageView.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 19/01/24.
//

import SwiftUI

struct RemoteImageView: View {
    var filename: String?
    var imageStringUrl: String
    var cornerRadius: CGFloat = 24
    var imageDidDoubleTap: () -> Void
    
    var body: some View {
        AsyncImage(url: URL(string: imageStringUrl)) { phase in
            switch phase {
            case .empty:
                ZStack(alignment: .center) {
                    Image(uiImage: UIImage())
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                        .background(Color.gray)
                    
                    ProgressView()
                }
            case .success(let image):
                image.resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFill()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .onTapGesture(count: 2) {
                        self.imageDidDoubleTap()
                    }
            default:
                Image(filename ?? "animal-elephant", bundle: nil)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .background(filename == nil ? Color.gray : Color.clear)
            }
        }
    }
}

#Preview {
    RemoteImageView(filename: nil, imageStringUrl: "https://raw.githubusercontent.com/unitedstates/images/gh-pages/congress/450x550/A000360.jpg", cornerRadius: 24, imageDidDoubleTap: {})
}
