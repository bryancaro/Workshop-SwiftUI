//
//  ObservableObjectViewModel.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

class StateObservableObjectViewModel: ObservableObject {
    //  MARK: - Published
    @Published private(set) var count = 0
    private(set) var countSignal = 0
    //  MARK: - Constants
    //  MARK: - Lifecycle
    init() {}
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
    
    func onAppear() {}
    
    func onDisappear() {}
    
    //  MARK: - Action
    func incrementCounter() {
        count += 1
    }
    
    func incrementCounterWithSignal() {
        countSignal += 1
        objectWillChange.send()
    }
}
