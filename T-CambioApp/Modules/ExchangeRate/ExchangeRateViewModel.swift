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
    @Published var exchangeRate: ExchangeRate?
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        setupSubscriptions()
        loadExchangeRate()
    }
    
    func loadExchangeRate() {
        fetchExchangeRate().sink { [weak self] exchangeRate in
            self?.exchangeRate = exchangeRate
        }.store(in: &subscriptions)
    }
    
    private func setupSubscriptions() {
        $amountInput
            .combineLatest($exchangeRate)
            .map { (input, exchangeRate) -> String? in
                guard
                    let amount = Double(input),
                    amount >= 0,
                    let rate = exchangeRate?.rate,
                    rate > 0
                else {
                    return nil
                }
                let result = amount * rate
                return String(format: "%.2f", result)
            }
            .replaceNil(with: "")
            .assign(to: \ExchangeRateViewModel.convertedAmount, on: self)
            .store(in: &subscriptions)
    }
    
    private func fetchExchangeRate() -> AnyPublisher<ExchangeRate, Never> {
        Just(ExchangeRate(rate: 3.74, updatedAt: Date()))
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
