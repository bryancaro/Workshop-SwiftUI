//
//  StyleGuide.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 22/11/22.
//

import UIKit
import SwiftUI

let screen = UIScreen.main.bounds

//  MARK: - BRAND LOGO
extension Image {
    static let O2OLogo = Image("O2O Logo")
}

//  MARK: - COLOR PALETTE
extension Color {
    static let Primary   = Color("primary-color")
    static let Secondary = Color("secondary-color")
    static let Info      = Color("info-color")
    static let Success   = Color("success-color")
    static let Warning   = Color("warning-color")
    static let Error     = Color("error-color")
    static let Black1    = Color("black_1-color")
    static let Black2    = Color("black_2-color")
    static let Black3    = Color("black_3-color")
    static let White     = Color("white-color")
    static let Gray1     = Color("gray_1-color")
    static let Gray2     = Color("gray_2-color")
    static let Gray3     = Color("gray_3-color")
    static let Gray4     = Color("gray_4-color")
    static let Gray5     = Color("gray_5-color")
}

//  MARK: - TYPOGRAPHIES
enum CustomFontWeight: String {
    case regular
    case bold
    
    var font: String {
        switch self {
        case .regular:
            return "BebasNeue-Regular"
        case .bold:
            return ""
        }
    }
}

enum CustomFontSize {
    case extraLarge
    case large
    case medium
    
    var size: Double {
        switch self {
        case .extraLarge:
            return 22
        case .large:
            return 20
        case .medium:
            return 18
        }
    }
}

extension Text {
    func customFont(size     : CustomFontSize,
                    weight   : CustomFontWeight,
                    color    : Color         = .primary,
                    alignment: TextAlignment = .center
    ) -> some View {
        self
            .font(.custom(weight.font, size: size.size))
            .foregroundColor(color)
            .multilineTextAlignment(alignment)
    }
}

//  MARK: - SHADOWS
extension View {
    func softShadowV1(color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(0.5), radius: 40, x: 0, y: 20)
    }
    
    func softShadowV2(color: Color = .primary) -> some View {
        self
            .shadow(color: color.opacity(0.4), radius: 200, x: 0, y: 90)
    }
}
