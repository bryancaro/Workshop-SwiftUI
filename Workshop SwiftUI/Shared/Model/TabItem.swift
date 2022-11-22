//
//  TabItem.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 19/11/22.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Rockets", icon: "globe.americas.fill", color: .red, selection: .rockets),
    TabItem(name: "Satellite", icon: "bonjour", color: .blue, selection: .satellite),
    TabItem(name: "Challenge", icon: "brain.head.profile", color: .green, selection: .challenge)
]

enum Tab: String {
    case rockets
    case satellite
    case challenge
}

/*
 Rockets picture = globe.americas.fill
 Satellite picture = bonjour
 Challenge picture = brain.head.profile
 */
