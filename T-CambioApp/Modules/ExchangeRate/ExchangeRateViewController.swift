//
//  ExchangeRateViewController.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit

class ExchangeRateViewController: UIViewController {

    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Exchange Rate"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
