//
//  StyleGuide-Modifier.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 22/11/22.
//

import SwiftUI

//  Image Logo Modifier
struct BadgeTextModifier: ViewModifier {
 
    func body(content: Content) -> some View {
        content
            .font(.footnote.weight(.semibold))
            .foregroundColor(.white)
            .padding(.horizontal)
            .frame(height: 35)
            .background(Color.blue.opacity(1))
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

extension View {
    func badgeStyle() -> some View {
        self
            .modifier(BadgeTextModifier())
    }
}
