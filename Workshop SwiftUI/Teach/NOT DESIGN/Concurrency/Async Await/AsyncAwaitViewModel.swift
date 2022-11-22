//
//  AsyncAwaitViewModel.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

class AsyncAwaitViewModel: ObservableObject {
    //  MARK: - Published
    @Published var data: [String] = []
    //  MARK: - Constants
    //  MARK: - Lifecycle
    init() {}
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
    
    func onAppear() {
        Task {
            await setFirstData()
            await setSecondAndThirdData()
            await setFourthData()
            await setFiveData()
        }
    }
    
    func onDisappear() {
        
    }
    
    //  MARK: - API Calls
    func setFirstDataInBackground() async {
        let text = "1 data: \(Thread.current)"
        data.append(text)
    }
    
    func setFirstData() async {
        await MainActor.run(body: {
            let text = "1 data: \(Thread.current)"
            data.append(text)
            print("TASK: FIRST TASK DONE")
        })
    }
    
    func setSecondAndThirdData() async {
        await MainActor.run(body: {
            let text1 = "2 data: \(Thread.current)"
            data.append(text1)
            
            let text2 = "3 data: \(Thread.current)"
            data.append(text2)
            print("TASK: SECOND TASK DONE")
        })
    }
    
    func setFourthData() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        await MainActor.run(body: {
            let text = "4 data: \(Thread.current)"
            data.append(text)
            print("TASK: THIRD TASK DONE")
        })
    }
    
    func setFiveData() async {
        await MainActor.run(body: {
            let text = "5 data: \(Thread.current)"
            data.append(text)
            print("TASK: FOURTH TASK DONE")
        })
    }
}
