//
//  ExchangeRateViewModel.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 21/05/25.
//

import Foundation
import Combine

class ExchangeRateViewModel {
    
    @Published var amountInput: String = ""
    @Published var convertedAmount: String = ""
    @Published var exchangeRate: ExchangeRate? = ExchangeRate(currency: "usd", rate: 3.65)
    
    var subscriptions: Set<AnyCancellable> = []
    
    init() {
        $amountInput
            .receive(on: RunLoop.main)
            .sink { [weak self] amountString in
                guard let self = self else { return }
                guard let rate = exchangeRate?.rate else { return }
                
                if let operableAmount = Double(amountString) {
                    convertedAmount = String(format: "%.2f", operableAmount * rate)
                } else { convertedAmount  = "" }
            }
            .store(in: &subscriptions)
    }
    
}
