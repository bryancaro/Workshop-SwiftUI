//
//  UIImpactFeedBack-Utilities.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 22/11/22.
//

import UIKit

func haptic(type: UINotificationFeedbackGenerator.FeedbackType) {
    UINotificationFeedbackGenerator().notificationOccurred(type)
}

func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    UIImpactFeedbackGenerator(style: style).impactOccurred()
}
