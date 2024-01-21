//
//  FavoriteFilterSheet.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 18/01/24.
//

import SwiftUI

struct FavoriteFilterSheet: View {
    @StateObject var viewModel = HomeAnimalViewModel()
    
    var filterDidTap: (String) -> Void
    @Binding var selectedOption: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Filter by Animal")
                .font(.title2)
                .padding(.vertical)
            
            List {
                SelectionCell(option: "Show All", selectedOption: self.$selectedOption)
                let options = viewModel.animalListViewModel.map { $0.name }
                ForEach(0..<options.count, id: \.self) { index in
                    let option = options[index]
                    SelectionCell(option: option, selectedOption: self.$selectedOption)
                }
            }
            
            Button(action: {
                dismiss()
                filterDidTap(selectedOption)
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
    @Binding var selectedOption: String

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
    }, selectedOption: .constant("Show All"))
}
