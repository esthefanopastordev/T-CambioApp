//
//  ExchangeRateViewController.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 6/05/25.
//

import UIKit
import Combine

final class ExchangeRateViewController: UIViewController {
    
    private enum Text {
        static let navigationTitle = "Exchange Rate"
        static let amountTitle = "Amount"
        static let convertedAmountTitle = "Converted Amount"
        static let indicativeRateTitle = "Indicative Exchange Rate"
        static let usd = "USD"
        static let pen = "PEN"
        static let placeholder = "0.00"
        static let exchangeRate = "1 USD = 3.65 PEN"
    }
    
    // MARK: - Views
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppStyle.Color.cardBackground
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layoutMargins = UIEdgeInsets(
            top: AppStyle.Spacing.cardPadding,
            left: AppStyle.Spacing.cardPadding,
            bottom: AppStyle.Spacing.cardPadding,
            right: AppStyle.Spacing.cardPadding
        )
        return view
    }()
    
    private let amountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let currencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let amountTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.keyboardType = .decimalPad
        tf.textAlignment = .right
        return tf
    }()
    
    private let convertedAmountTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let currencyToConvertAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let convertedAmountTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isEnabled = false
        tf.textAlignment = .right
        return tf
    }()
    
    private let exchangeRateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exchangeRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            makeFieldSection(title: amountTitleLabel, currency: currencyLabel, field: amountTextField),
            makeSectionSeparator(),
            makeFieldSection(title: convertedAmountTitleLabel, currency: currencyToConvertAmountLabel, field: convertedAmountTextField)
        ])
        stack.axis = .vertical
        stack.spacing = 0 // important for the spacer to control spacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var viewModel: ExchangeRateViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    init(viewModel: ExchangeRateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupViews()
        applyStyles()
        setupSubscriptions()
    }
    
    // MARK: - Setup
    private func setupNavigationBar() {
        navigationItem.title = Text.navigationTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundEffect = UIBlurEffect(style: .systemMaterial)
        appearance.backgroundColor = AppStyle.Color.navBarBackground
        appearance.shadowColor = AppStyle.Color.separator
        appearance.titleTextAttributes = [.foregroundColor: AppStyle.Color.label]
        appearance.largeTitleTextAttributes = [.foregroundColor: AppStyle.Color.label]
        
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        navBar.compactAppearance = appearance
        navBar.tintColor = AppStyle.Color.tint
    }
    
    private func setupViews() {
        view.backgroundColor = AppStyle.Color.background
        
        view.addSubview(containerView)
        containerView.addSubview(mainStack)
        
        view.addSubview(exchangeRateTitleLabel)
        view.addSubview(exchangeRateLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: AppStyle.Spacing.sectionSpacing),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AppStyle.Spacing.screenPadding),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -AppStyle.Spacing.screenPadding),
            
            mainStack.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: containerView.layoutMarginsGuide.bottomAnchor),
            
            exchangeRateTitleLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: AppStyle.Spacing.sectionSpacing + 16),
            exchangeRateTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AppStyle.Spacing.screenPadding),
            
            exchangeRateLabel.topAnchor.constraint(equalTo: exchangeRateTitleLabel.bottomAnchor, constant: AppStyle.Spacing.elementSpacing),
            exchangeRateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AppStyle.Spacing.screenPadding),
        ])
    }
    
    private func applyStyles() {
        // Titles
        amountTitleLabel.text = Text.amountTitle
        convertedAmountTitleLabel.text = Text.convertedAmountTitle
        exchangeRateTitleLabel.text = Text.indicativeRateTitle
        
        // Currency Labels
        currencyLabel.text = Text.pen
        currencyToConvertAmountLabel.text = Text.usd
        
        // TextFields
        amountTextField.placeholder = Text.placeholder
        convertedAmountTextField.placeholder = Text.placeholder
        
        // Exchange rate
        exchangeRateLabel.text = Text.exchangeRate
        
        // Fonts
        amountTitleLabel.font = AppStyle.Font.sectionTitle
        convertedAmountTitleLabel.font = AppStyle.Font.sectionTitle
        currencyLabel.font = AppStyle.Font.currencyLabel
        currencyToConvertAmountLabel.font = AppStyle.Font.currencyLabel
        amountTextField.font = AppStyle.Font.value
        convertedAmountTextField.font = AppStyle.Font.value
        exchangeRateLabel.font = AppStyle.Font.value
        exchangeRateTitleLabel.font = AppStyle.Font.smallCaption
        
        // Colors
        exchangeRateLabel.textColor = AppStyle.Color.secondaryLabel
        exchangeRateTitleLabel.textColor = AppStyle.Color.secondaryLabel
    }
    
    private func setupSubscriptions() {
        amountTextField.textPublisher
            .assign(to: \.amountInput, on: viewModel)
            .store(in: &subscriptions)
        
        viewModel.$exchangeRate
            .receive(on: RunLoop.main)
            .sink { exchangeRate in
                print("Exchange Rate: \(String(describing: exchangeRate?.rate))")
            }
            .store(in: &subscriptions)
        
        viewModel.$convertedAmount
            .receive(on: RunLoop.main)
            .sink { [weak self] value in
                self?.convertedAmountTextField.text = value
            }
            .store(in: &subscriptions)
    }
    
    private func makeFieldSection(title: UILabel, currency: UILabel, field: UITextField) -> UIStackView {
        let currencyStack = UIStackView(arrangedSubviews: [currency, field])
        currencyStack.axis = .horizontal
        currencyStack.spacing = AppStyle.Spacing.elementSpacing
        currencyStack.distribution = .fill
        currency.setContentHuggingPriority(.required, for: .horizontal)
        field.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        let verticalStack = UIStackView(arrangedSubviews: [title, currencyStack])
        verticalStack.axis = .vertical
        verticalStack.spacing = AppStyle.Spacing.elementSpacing
        return verticalStack
    }
    
    private func makeSectionSeparator(spacing: CGFloat = 24) -> UIView {
        let halfSpacing = spacing / 2
        let topSpacer = UIView()
        topSpacer.translatesAutoresizingMaskIntoConstraints = false
        topSpacer.heightAnchor.constraint(equalToConstant: halfSpacing).isActive = true
        
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = AppStyle.Color.separator
        line.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale).isActive = true
        
        let bottomSpacer = UIView()
        bottomSpacer.translatesAutoresizingMaskIntoConstraints = false
        bottomSpacer.heightAnchor.constraint(equalToConstant: halfSpacing).isActive = true
        
        let wrapper = UIStackView(arrangedSubviews: [topSpacer, line, bottomSpacer])
        wrapper.axis = .vertical
        wrapper.translatesAutoresizingMaskIntoConstraints = false
        return wrapper
    }
    
}

extension UITextField {
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
    
}
