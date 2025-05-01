//
//  AppState.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 24/04/2025.
//

import SwiftUI

struct UserPreferences {
    var preferredLanguages: [String]
    var preferredActivities: [String]
    var budgetLevel: Int
}

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var hasCompletedSignup: Bool = false
    @Published var favorites: [Destination] = []
    @Published var userPreferences = UserPreferences(
        preferredLanguages: [],
        preferredActivities: [],
        budgetLevel: 2
        )
    
    @Published var userName: String = ""
    @Published var userEmail: String = ""
}

