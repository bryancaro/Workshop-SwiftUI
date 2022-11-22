//
//  PreferenceKey.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 19/11/22.
//

import SwiftUI

//  MARK: - Tab Bar
struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

//  MARK: - Navigation Header Scroll
struct ScrollPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
