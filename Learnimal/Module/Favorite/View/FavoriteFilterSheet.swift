//
//  FavoriteFilterSheet.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 18/01/24.
//

import SwiftUI

struct FavoriteFilterSheet: View {
    var filterDidTap: (String) -> Void
    var options: [String]
    @Binding var selectedOption: String?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Filter by Animal")
                .font(.title2)
                .padding(.vertical)
            
            List {
                ForEach(options, id: \.self) { option in
                    SelectionCell(option: option, selectedOption: self.$selectedOption)
                }
            }
            
            Button(action: {
                dismiss()
                filterDidTap("")
            }, label: {
                Text("Set")
                    .frame(maxWidth: .infinity)
                    .padding([.vertical])
                    .background(Color.yellow)
            })
        }
    }
}

struct SelectionCell: View {

    let option: String
    @Binding var selectedOption: String?

    var body: some View {
        HStack {
            Text(option)
            Spacer()
            if option == selectedOption {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }   
        .onTapGesture {
            self.selectedOption = self.option
        }
    }
}

#Preview {
    FavoriteFilterSheet(filterDidTap: { selectedOption in
        //
    }, options: ["show all", "cheetah", "fox"], selectedOption: .constant("show all"))
}
