//
//  HeaderComponent.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 23/04/2025.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            
            Image("logo-travinder")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
        }
    }
}

#Preview {
    HeaderComponent()
}
