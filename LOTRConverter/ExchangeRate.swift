//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Siddarth Bhura on 08/10/25.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let exchangeRateText: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack {
            // Left currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            
            // Exchange Rate Text
            Text(exchangeRateText)
            
            // Right currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, exchangeRateText: "1 Gold Piece = 4 Gold Pennies", rightImage: .goldpenny)
}
