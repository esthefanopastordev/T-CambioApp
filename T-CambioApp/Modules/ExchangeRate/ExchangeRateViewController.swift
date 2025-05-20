//
//  ExchangeRateViewController.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit

class ExchangeRateViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let amountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let convertedAmountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let convertedAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let convertedAmountTextField: UITextField = {
        let textField = UITextField()
        textField.isEnabled = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let exchangeRateTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let exchangeRateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Exchange Rate"

        view.addSubview(titleLabel)
        view.addSubview(containerView)

        amountTitleLabel.text = "Amount"

        containerView.addSubview(amountTitleLabel)

        amountLabel.text = "USD"

        containerView.addSubview(amountLabel)

        amountTextField.placeholder = "0.00"

        containerView.addSubview(amountTextField)

        convertedAmountTitleLabel.text = "Converted Amount"

        containerView.addSubview(convertedAmountTitleLabel)

        convertedAmountLabel.text = "PEN"

        containerView.addSubview(convertedAmountLabel)

        convertedAmountTextField.placeholder = "0.00"

        containerView.addSubview(convertedAmountTextField)

        exchangeRateTitleLabel.text = "Indicative Exchange Rate"

        containerView.addSubview(exchangeRateTitleLabel)

        exchangeRateLabel.text = "1 USD = 3.65 PEN"

        containerView.addSubview(exchangeRateLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            containerView.heightAnchor.constraint(equalToConstant: 200),
            amountTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            amountTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            amountLabel.topAnchor.constraint(equalTo: amountTitleLabel.bottomAnchor, constant: 14),
            amountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            amountTextField.topAnchor.constraint(equalTo: amountTitleLabel.bottomAnchor, constant: 14),
            amountTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            amountTextField.leadingAnchor.constraint(greaterThanOrEqualTo: amountLabel.trailingAnchor, constant: 8),
            convertedAmountTitleLabel.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 40),
            convertedAmountTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            convertedAmountLabel.topAnchor.constraint(equalTo: convertedAmountTitleLabel.bottomAnchor, constant: 14),
            convertedAmountLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            convertedAmountTextField.topAnchor.constraint(equalTo: convertedAmountTitleLabel.bottomAnchor, constant: 14),
            convertedAmountTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            convertedAmountTextField.leadingAnchor.constraint(greaterThanOrEqualTo: convertedAmountLabel.trailingAnchor, constant: 8),
            exchangeRateTitleLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 32),
            exchangeRateTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            exchangeRateLabel.topAnchor.constraint(equalTo: exchangeRateTitleLabel.bottomAnchor, constant: 14),
            exchangeRateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
    }

}
