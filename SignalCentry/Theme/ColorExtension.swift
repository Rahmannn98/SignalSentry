//
//  ColorExtension.swift
//  SignalCentry
//
//  Created by Saifulloh Rahman on 11/06/26.
//

import SwiftUI

extension Color {
    static let signalNeon = Color (red: 0.20, green: 0.90, blue: 0.50)
    static let spaceDark = Color(red: 0.05, green: 0.07, blue: 0.10)
    static let background = Color.black
    static let primaryText = Color.white
    static let secondaryText = Color.white.opacity(0.7)
    static let accent = Color.cyan
    static let warning = Color.orange
    static let glassStroke = Color.white.opacity(0.15)
    static let glassFill = Color.white.opacity(0.06)
    static let cardRadius: CGFloat = 16
    static let cardPadding: CGFloat = 16
}

extension View {
    @ViewBuilder
    func `if`(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
