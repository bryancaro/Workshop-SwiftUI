//
//  TeamWidgetViewModel.swift
//  TeamWidgetExtension
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

class TeamWidgetViewModel: ObservableObject {
    //  MARK: - Published
    @Published var data: [String] = []
    @Published var person: String = ""
    //  MARK: - Constants
    let developers: [String] = ["👩‍💻 Veronica Cordobés", "🧑🏼‍💻 Pablo Gil", "👨‍💻 Alberto Aragón",
                           "👩‍💻 Jesmir Baloa", "🧑🏻‍💻 Victor Elvira", "🧑🏽‍💻 Josseph Colonia",
                           "👨‍💻 David Tejedor", "👨‍💻 Daniel Plata", "👨‍💻 Javier Garcia",
                           "👨‍💻 Alberto Fernández", "👨‍💻 Alberto Garcia", "👨‍💻 Alberto Garcia",
                           "👨‍💻 Cesar Martinez", "👨‍💻 Francesco Beccu", "👨‍💻 Jon Gonzalez",
                           "👨‍💻 Bryan Caro"]
    //  MARK: - Lifecycle
    init() {
        onAppear()
    }
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
    
    func onAppear() {
        Task {
            await getTeamData()
            
            let developer = await getDeveloper()
            self.person = developer
        }
    }
    
    func onDisappear() {
        
    }
    
    //  MARK: - API Calls
    func getTeamData() async {
        await MainActor.run(body: {
            self.data = developers
        })
    }
    
    func getDeveloper() async -> String {
        self.data.randomElement() ?? "👨‍💻 Bryan Caro"
    }
}
