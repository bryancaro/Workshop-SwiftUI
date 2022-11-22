//
//  ActorsViewModel.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 8/11/22.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    var data: [String] = []
    private let quee = DispatchQueue(label: "com.async.DataManager")
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return data.randomElement()
    }
    
    func getRandomDataWithQuee(completion: @escaping(String?) -> Void) {
        quee.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)
            completion(self.data.randomElement())
        }
    }
}

//  ALL CODED IN ACTOR ARE ISOLLATED
/*
 We need to await to get to that point
 */
actor ActorManager {
    static let shared = ActorManager()
    
    private init() {}
    
    var data: [String] = []
    
    nonisolated let dataNoN: String = "Hola"
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return data.randomElement()
    }
    
    nonisolated
    func getNoNRandomData() -> String? {

        return "hELLO"
    }
}
