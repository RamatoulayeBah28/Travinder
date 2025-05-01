//
//  TravinderModel.swift
//  Travinder
//
//  Created by Ramatoulaye Bah on 22/04/2025.
//

import SwiftUI

struct Destination: Identifiable {
    let id = UUID()
    var place: String
    var country: String
    var image: String
    var description: String
}
