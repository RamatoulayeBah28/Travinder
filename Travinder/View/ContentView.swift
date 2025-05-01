//
//  ContentView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 24/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .main
    @StateObject private var appState = AppState()

    var body: some View {
        Group {
            if !appState.isLoggedIn {
                LoginScreen()
            } else if !appState.hasCompletedSignup {
                SignUpView()
            } else {
                VStack {
                    Spacer()
                    Group {
                        switch selectedTab {
                        case .main:
                            MainScreenView()
                        case .profile:
                            ProfileView()
                        case .matches:
                            FavoritesView()
                        }
                    }
                    FooterView(selectedTab: $selectedTab)
                }
            }
        }
        .environmentObject(appState)
    }
}
