//
//  Rocket.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 20/11/22.
//

import SwiftUI

struct Rocket: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String = ""
}

var rockets = [
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Rocket 0"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Rocket 1"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Rocket 2"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Rocket 3"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Rocket 4"),
]

var satellites = [
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Robot 1", background: "Background 1"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Planet 1", background: "Background 2"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Robot 2", background: "Background 3"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Planet 2", background: "Background 4"),
    Rocket(index: 1, title: "STARSHIP SN15", subtitle: "MADE IN USA", text: "SpaceX’s Starship spacecraft and Super Heavy rocket...", image: "Robot 3", background: "Background 5"),
]
