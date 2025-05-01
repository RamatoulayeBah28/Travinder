//
//  ProfileView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 24/04/2025.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var selectedLanguages: [String] = []
    @State private var selectedActivities: [String] = []
    @State private var budgetLevel: Int = 2
    @State private var saved = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Signed in as")) {
                    Text(appState.userName).font(.headline)
                    Text(appState.userEmail).font(.subheadline).foregroundColor(.gray)
                }
                
                Section(header: Text("Languages")) {
                    MultiSelectList(options: ["English", "French", "Spanish", "Italian", "Arabic", "Mandarin", "Japanese"], selection: $selectedLanguages)
                }
                
                Section(header: Text("Activities")) {
                    MultiSelectList(options: ["Beach", "Hiking", "Museums", "Food Tour", "Nightlife"], selection: $selectedActivities)
                }
                
                Section(header: Text("Budget")) {
                    Picker("Budget", selection: $budgetLevel) {
                        Text("$").tag(1)
                        Text("$$").tag(2)
                        Text("$$$").tag(3)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Button("Save Preferences") {
                    appState.userPreferences = UserPreferences(
                        preferredLanguages: selectedLanguages,
                        preferredActivities: selectedActivities,
                        budgetLevel: budgetLevel
                        
                        )
                    saved = true
                }
                .foregroundColor(Color.blue)
                
                if saved {
                    Text("Preferences Saved!").foregroundColor(.green)
                }
            }.navigationTitle("Your Preferences")
        }
    }
}

#Preview {
    ProfileView()
}
