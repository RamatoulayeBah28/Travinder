//
//  AppState.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 24/04/2025.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var favorites: [Destination] = []
}

