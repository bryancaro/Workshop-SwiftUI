//
//  StrokeStyle.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 19/11/22.
//

import SwiftUI

//  NAME+TYPE = STROKE+TYPE
struct StrokeStyle: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    
    var cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .stroke(
                        .linearGradient(
                            colors: [.white.opacity(colorScheme == .dark ? 0.6 : 0.3),
                                     .black.opacity(colorScheme == .dark ? 0.3 : 0.1)],
                            startPoint: .top,
                            endPoint: .bottom)
                    )
                    .blendMode(.overlay)
            )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30.0) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
