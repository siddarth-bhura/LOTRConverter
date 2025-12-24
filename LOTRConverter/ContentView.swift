//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Siddarth Bhura on 07/10/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    @State private var showExchangeInfo = false
    @State private var showSelectCurrency = false
    @State private var leftAmount = ""
    @State private var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    let currencyTip = CurrencyTip()
    
    var body: some View {
        ZStack {
            // Background Image
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                // Pony Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                // Currency Exchange Text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                // Conversion section
                HStack {
                    // Left Conversion
                    VStack {
                        // Currency
                        HStack {
                            // Currency Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            // Currency Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        
                        // Textfield
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                    }
                    
                    // Equal
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    // Right Conversion
                    VStack {
                        // Currency
                        HStack {
                            // Currency Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            // Currency Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        // Textfield
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($rightTyping)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(12)
                .padding()
                .keyboardType(.decimalPad)
                
                Spacer()
                
                // Info Button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftAmount) {
            if leftTyping {
                rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightAmount) {
            if rightTyping {
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(fromCurrency: $leftCurrency, toCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
