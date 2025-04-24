//
//  FooterView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 23/04/2025.
//

import SwiftUI

struct FooterView: View {
    @Binding var selectedTab: Tab

    var body: some View {
        HStack {
            Button(action: {
                // ACTION profile
                selectedTab = .profile
            }) {
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:30, height: 30)
                    .foregroundColor(.orange)
            }.padding()
            
            Spacer()
            
            Button(action: {
                // ACTION Main Screen
                selectedTab = .main
                
            }) {
                Image(systemName: "mappin.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                    .foregroundColor(.orange)
            }
            
            Spacer()
            
            Button(action: {
                // ACTION Match Screen
                selectedTab = .matches
                
            }) {
                Image("travinder-icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            }

            .padding()
        }
        .padding(.horizontal, 30)
            .padding(.bottom, 20)
            .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

#Preview {
    FooterView(selectedTab: .constant(.main))
        .environmentObject(AppState())
}
