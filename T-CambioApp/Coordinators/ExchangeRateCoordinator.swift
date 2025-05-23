//
//  ExchangeRateCoordinator.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit

final class ExchangeRateCoordinator: MainCoordinatorProtocol {

    var childCoordinators: [String : any MainCoordinatorProtocol] = [:]
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

}

extension ExchangeRateCoordinator {

    func start() {
        let exchangeRateViewModel = ExchangeRateViewModel()
        let exchangeRate = ExchangeRateViewController(viewModel: exchangeRateViewModel)
        navigationController.setViewControllers([exchangeRate], animated: false)
    }

}
