//
//  TaskGroupViewModel.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

class TaskGroupViewModel: ObservableObject {
    //  MARK: - Published
    @Published var data: [UIImage] = []
    //  MARK: - Constants
    //  MARK: - Lifecycle
    init() {}
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
    
    func onAppear() {
        Task {
            do {
                let images = try await fetchImageWithTaskGroup()
                
                await MainActor.run(body: {
                    self.data.append(contentsOf: images)
                })
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func onDisappear() {}
    
    //  MARK: - API Calls
    func fetchImage(urlString: String) async throws -> UIImage {
        do {
            guard let url = URL(string: urlString) else {
                throw URLError(.badURL)
            }
            
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
    
    func fetchImageWithTaskGroup() async throws -> [UIImage] {
        let urlStrings: [String] = [
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200",
            "https://picsum.photos/200"
        ]
        
        return try await withThrowingTaskGroup(of: UIImage.self, body: { group in
            var images: [UIImage] = []
            images.reserveCapacity(urlStrings.count) // PERFORMANCE BOOST
            
            for url in urlStrings {
                group.addTask {
                    try await self.fetchImage(urlString: url)
                }
            }
            
            for try await image in group {
                images.append(image)
            }
            
            return images
        })
    }
}
