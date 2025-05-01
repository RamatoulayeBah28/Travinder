//
//  FavoritesView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 24/04/2025.
//

import SwiftUI

struct FavoritesView: View {
    @State private var selectedDestination: Destination?
    @State private var showDetail = false
    @EnvironmentObject var appState: AppState

    var body: some View {
        ScrollView {
            ForEach(appState.favorites) { favorite in
                CardView(travinder: favorite, onMoreTapped: {
                    selectedDestination = favorite
                    showDetail = true
                })
                .padding()
            }
        }
        .sheet(isPresented: $showDetail) {
            if let destination = selectedDestination {
                DestinationDetailView(destination: destination, matchPercentage: 87)
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
