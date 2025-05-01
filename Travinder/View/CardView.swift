//
//  CardView.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 22/04/2025.
//

import SwiftUI

struct CardView: View, Identifiable {
    // MARK: - PROPERTIES: 
    let id = UUID()
    var travinder: Destination
    var onMoreTapped: (() -> Void)? = nil
    
    var body: some View {
        Image(travinder.image).resizable().cornerRadius(24).scaledToFit().frame(minWidth:0, maxWidth: .infinity)
            .overlay(VStack(alignment: .center, spacing: 12) {
            Text(travinder.place.uppercased()).foregroundColor(Color.white).font(.largeTitle).fontWeight(.bold).shadow(radius: 1).padding(.horizontal, 18).padding(.vertical, 4)
                .overlay(
                Rectangle().fill(Color.white).frame(height: 1), alignment: .bottom
                
            )
            Text(travinder.country.uppercased()).foregroundColor(Color.black).font(.footnote).fontWeight(.bold).frame(minWidth: 85).padding(.horizontal, 10).padding(.vertical, 5).background(
                Capsule().fill(Color.white)
            )
                
                HStack {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 32, weight: .light))
                        .foregroundColor(.red)
                    
                    Spacer()
                    Button(action: {
                        // ACTION
                        onMoreTapped?()
                        print("Success")
                        
                    }) {
                        Text("More".uppercased())
                            .font(.system(.subheadline, design: .rounded)).fontWeight(.heavy)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .accentColor(Color.white)
                            .background(
                                Capsule().fill(Color.blue)
                            )
                    }
                    
                    Spacer()
                    
                    Image(systemName: "heart.circle")
                        .font(.system(size: 32, weight: .light))
                        .foregroundColor(.green)
                }.padding(.horizontal)
                    .offset(y: 20)
        }
                .frame(minWidth: 200).padding(.bottom, 50), alignment: .bottom)
       
    }
        
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(travinder: travinderData[0]).previewLayout(.fixed(width: 375, height: 600))
    }
    
}
