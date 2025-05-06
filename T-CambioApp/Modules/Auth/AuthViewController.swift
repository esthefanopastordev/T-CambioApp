//
//  AuthViewController.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit

protocol AuthViewControllerDelegate {
    
    func didLoginWith(email: String, password: String)
    
}

final class AuthViewController: UIViewController {

    var delegate: AuthViewControllerDelegate?

    let titleLabel = UILabel()
    let buttonGo = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "T-CambioApp"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonGo.setTitle("Go to T-Cambio", for: .normal)
        buttonGo.translatesAutoresizingMaskIntoConstraints = false
        buttonGo.addTarget(self, action: #selector(didButtonGoTap), for: .touchUpInside)

        view.addSubview(titleLabel)
        view.addSubview(buttonGo)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonGo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonGo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16)
        ])
    }

    @objc func didButtonGoTap(_ sender: UIButton) {
        delegate?.didLoginWith(email: "email@email.com", password: "123456abC")
    }

}

