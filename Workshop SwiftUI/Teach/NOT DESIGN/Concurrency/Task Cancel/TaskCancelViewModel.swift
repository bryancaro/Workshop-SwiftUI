//
//  TaskCancelViewModel.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

class TaskCancelViewModel: ObservableObject {
    //  MARK: - Published
    @Published var image: UIImage? = nil
    //  MARK: - Constants
    var fetchImageTask: Task<(), Never>?
    //  MARK: - Lifecycle
    init() {}
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
    
    /*
     func onAppear() {
         Task {
             await fetchImage()
         }
     }
     
     func onDisappear() {}
     */
    
    func onAppear() {
        fetchImageTask = Task {
            await fetchImageWithDelay()
        }
    }
    
    
    func onDisappear() {
        fetchImageTask?.cancel()
    }
    
    //  MARK: - API Calls
    func fetchImage() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            
            await MainActor.run {
                self.image = UIImage(data: data)
                print("TASK: IMAGE DOWNLOADED SUCCESSFULLY")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImageWithDelay() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            
            await MainActor.run {
                self.image = UIImage(data: data)
                print("TASK: IMAGE DOWNLOADED SUCCESSFULLY")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
