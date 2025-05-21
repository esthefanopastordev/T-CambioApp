//
//  AppStyle.swift
//  T-CambioApp
//
//  Created by Esthefano Pastor on 21/05/25.
//

import UIKit

enum AppStyle {
    
    enum Spacing {
        static let screenPadding: CGFloat = 20
        static let sectionSpacing: CGFloat = 32
        static let elementSpacing: CGFloat = 8
        static let cardPadding: CGFloat = 20
    }
    
    enum Font {
        static let sectionTitle = UIFont.preferredFont(forTextStyle: .body)
        static let currencyLabel = UIFont.preferredFont(forTextStyle: .subheadline)
        static let value = UIFont.monospacedSystemFont(ofSize: 17, weight: .regular)
        static let smallCaption = UIFont.preferredFont(forTextStyle: .caption1)
    }
    
    enum Color {
        static let background = UIColor.systemGroupedBackground
        static let cardBackground = UIColor.secondarySystemGroupedBackground
        static let navBarBackground = UIColor.systemBackground
        static let label = UIColor.label
        static let secondaryLabel = UIColor.secondaryLabel
        static let separator = UIColor.separator
        static let tint = UIColor.link
    }
    
}
