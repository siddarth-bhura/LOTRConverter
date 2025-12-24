//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Siddarth Bhura on 24/12/25.
//

import TipKit

struct CurrencyTip: Tip {
    
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or right currency to bring up the Select Currency Screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
    
}
