//
//  MultiSelectList.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 29/04/2025.
//

import SwiftUI

struct MultiSelectList: View {
    let options: [String]
    @Binding var selection: [String]
    
    var body: some View {
        ForEach(options, id: \.self) { option in
            Button(action: {
                if selection.contains(option) {
                    selection.removeAll(where: { $0 == option })
                } else {
                    selection.append(option)
                }
            }) {
                HStack {
                    Text(option)
                    Spacer()
                    if selection.contains(option) {
                        Image(systemName: "checkmark")
                    }
                }
                .padding(.vertical, 4)
            }
        }
    }
}
