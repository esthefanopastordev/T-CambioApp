//
//  AuthCoordinator.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit

protocol AuthCoordinatorDelegate {

    func didAuthenticate(coordinator: AuthCoordinator)

}

final class AuthCoordinator: MainCoordinatorProtocol {

    var childCoordinators: [String : any MainCoordinatorProtocol] = [:]
    var navigationController: UINavigationController
    var delegate: AuthCoordinatorDelegate?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

}

extension AuthCoordinator {

    func start() {
        let auth = AuthViewController()
        auth.delegate = self
        navigationController.pushViewController(auth, animated: false)
    }

}

extension AuthCoordinator: AuthViewControllerDelegate {

    func didLoginWith(email: String, password: String) {
        // TODO: Login with email and password
        delegate?.didAuthenticate(coordinator: self)
    }

}
