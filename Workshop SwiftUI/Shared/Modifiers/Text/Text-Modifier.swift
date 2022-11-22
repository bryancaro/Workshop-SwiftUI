//
//  Text-Modifier.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 20/11/22.
//

import SwiftUI

//  MARK: - Animatable Text Modifiers
struct AnimatableFontModifier: Animatable, ViewModifier {
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

//  MARK: - Extension to View
extension View {
    func animateFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self
        .modifier(AnimatableFontModifier(size: size, weight: weight, design: design))
    }
}

