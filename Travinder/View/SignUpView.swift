//
//  SignUpView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 30/04/2025.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var appState: AppState

    @State private var selectedLanguages: [String] = []
    @State private var selectedActivities: [String] = []
    @State private var budgetLevel: Int = 2
    @State private var saved = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferred Languages")) {
                    MultiSelectList(
                        options: ["English", "French", "Spanish", "Arabic", "Mandarin", "Japanese", "Italian"],
                        selection: $selectedLanguages
                    )
                }

                Section(header: Text("Preferred Activities")) {
                    MultiSelectList(
                        options: ["Beach", "Hiking", "Museums", "Food Tour", "Nightlife", "Shopping"],
                        selection: $selectedActivities
                    )
                }

                Section(header: Text("Budget Preference")) {
                    Picker("Budget", selection: $budgetLevel) {
                        Text("$").tag(1)
                        Text("$$").tag(2)
                        Text("$$$").tag(3)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Button("Save & Continue") {
                    appState.userPreferences = UserPreferences(
                        preferredLanguages: selectedLanguages,
                        preferredActivities: selectedActivities,
                        budgetLevel: budgetLevel
                    )
                    appState.hasCompletedSignup = true
                    saved = true
                }
                .foregroundColor(.orange)
                
                if saved {
                    Text("✅ Preferences saved!").foregroundColor(.green)
                }
            }
            .navigationTitle("Complete Your Profile")
        }
    }
}


#Preview {
    SignUpView()
}
