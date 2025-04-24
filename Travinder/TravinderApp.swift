//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by Ramatoulaye Bah on 22/04/2025.
//
import SwiftUI

@main
struct TravinderApp: App {
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environmentObject(appState)
        }
    }
}
