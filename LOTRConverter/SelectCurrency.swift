//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Siddarth Bhura on 08/10/25.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var fromCurrency: Currency
    @Binding var toCurrency: Currency
    
    var body: some View {
        ZStack {
            // Background Parchment Image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                // Text
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                // Currency icons
                IconGrid(currency: $fromCurrency)
                
                // Text
                Text("Select the currency you would like to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Currency icons
                IconGrid(currency: $toCurrency)
                
                // Done button
                Button("Done") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    @Previewable @State var fromCurrency: Currency = .silverPenny
    @Previewable @State var toCurrency: Currency = .goldPenny
    SelectCurrency(fromCurrency: $fromCurrency, toCurrency: $toCurrency)
}
