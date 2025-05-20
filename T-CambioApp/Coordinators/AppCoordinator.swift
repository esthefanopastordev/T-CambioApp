//
//  AppCoordinator.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit

final class AppCoordinator: MainCoordinatorProtocol {

    private var isLoggedIn: Bool = true

    var childCoordinators: [String : MainCoordinatorProtocol] = [:]
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

}

extension AppCoordinator {

    func start() {
        if isLoggedIn {
            showContent()
        } else {
            showAuthentication()
        }
    }

}

extension AppCoordinator {

    func showAuthentication() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        authCoordinator.delegate = self
        authCoordinator.start()
        childCoordinators["auth"] = authCoordinator
    }

}

extension AppCoordinator: AuthCoordinatorDelegate {

    func didAuthenticate(coordinator: AuthCoordinator) {
        childCoordinators.removeValue(forKey: "auth")
        showContent()
    }

}

extension AppCoordinator {

    func showContent() {
        let exchangeRateCoordinator = ExchangeRateCoordinator(navigationController: navigationController)
        exchangeRateCoordinator.start()
        childCoordinators["exchangeRate"] = exchangeRateCoordinator
    }

}
