//
//  MainCoordinatorProtocol.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit

protocol MainCoordinatorProtocol {

    var childCoordinators: [String: MainCoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get }
    func start()

}
