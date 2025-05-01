//
//  DestinationDetailView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 29/04/2025.
//

import SwiftUI

struct DestinationDetailView: View {
    var destination: Destination
    var matchPercentage: Int
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("\(destination.place), \(destination.country)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Image(destination.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                
                Text("Match: \(matchPercentage)%")
                    .font(.title2)
                    .foregroundColor(.green)
                
                Text(destination.description)
                    .padding()
            }
            .padding()
        }
        .navigationTitle(destination.place)
    }
    
}

struct DestinationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetailView(destination: travinderData[0], matchPercentage: 10).previewLayout(.fixed(width: 375, height: 600))
       
    }
}

