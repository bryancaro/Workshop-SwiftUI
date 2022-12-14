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
    let developers: [String] = ["π©βπ» Veronica CordobΓ©s", "π§πΌβπ» Pablo Gil", "π¨βπ» Alberto AragΓ³n",
                           "π©βπ» Jesmir Baloa", "π§π»βπ» Victor Elvira", "π§π½βπ» Josseph Colonia",
                           "π¨βπ» David Tejedor", "π¨βπ» Daniel Plata", "π¨βπ» Javier Garcia",
                           "π¨βπ» Alberto FernΓ‘ndez", "π¨βπ» Alberto Garcia", "π¨βπ» Alberto Garcia",
                           "π¨βπ» Cesar Martinez", "π¨βπ» Francesco Beccu", "π¨βπ» Jon Gonzalez",
                           "π¨βπ» Bryan Caro"]
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
        self.data.randomElement() ?? "π¨βπ» Bryan Caro"
    }
}
