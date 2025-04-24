//
//  FavoritesView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 24/04/2025.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView {
            ForEach(appState.favorites) { favorite in
                            CardView(travinder: favorite)
                                .padding()
                        }
        }
        Text("Your Matches")
            .font(.largeTitle)
            .bold()
            .padding(.top)

    }
}


#Preview {
    FavoritesView()
        .environmentObject(AppState())
}
