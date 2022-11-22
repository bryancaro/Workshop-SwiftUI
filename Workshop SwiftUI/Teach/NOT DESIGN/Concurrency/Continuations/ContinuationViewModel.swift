//
//  ContinuationViewModel.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

class ContinuationViewModel: ObservableObject {
    //  MARK: - Published
    @Published var image: UIImage?
    //  MARK: - Constants
    //  MARK: - Lifecycle
    init() {}
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
    
    func onAppear() {
        Task {
//            await getImage()
            await getImageFromCompletionConverted()
        }
    }
    
    func onDisappear() {}
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/200") else { return }
        
        do {
            let image = try await fetchImageWithDataTask(url: url)
            
            await MainActor.run(body: {
                self.image = image
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getImageFromCompletionConverted() async {
        let image = await getHeartImageFromDataBase()
        
        await MainActor.run(body: {
            self.image = image
        })
    }
    
    //  MARK: - API Calls
    func fetchImageWithData(url: URL) async throws -> UIImage {
        do {
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
    
    func fetchImageWithDataTask(url: URL) async throws -> UIImage {
        return try await withCheckedThrowingContinuation({ continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data {
                    if let image = UIImage(data: data) {
                        continuation.resume(returning: image)
                    } else {
                        continuation.resume(throwing: URLError(.badURL))
                    }
                } else if let error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }
            .resume()
        })
    }
    
    func getHeartImageFromDataBase(completion: @escaping(UIImage) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            completion(UIImage(systemName: "heart.fill")!)
        })
    }
    
    func getHeartImageFromDataBase() async -> UIImage {
        return await withCheckedContinuation({ continuation in
            getHeartImageFromDataBase { image in
                continuation.resume(returning: image)
            }
        })
    }
}
