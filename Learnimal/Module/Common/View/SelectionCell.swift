//
//  SelectionCell.swift
//  Learnimal
//
//  Created by Asep Hikmat Fatahillah on 22/01/24.
//

import SwiftUI

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
        .contentShape(Rectangle())
        .onTapGesture {
            self.selectedOption = self.option
        }
    }
}
