//
//  AsyncLetViewModel.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

class AsyncLetViewModel: ObservableObject {
    //  MARK: - Published
    @Published var data: [UIImage] = []
    //  MARK: - Constants
    //  MARK: - Lifecycle
    init() {}
    
    deinit {
        print("[DEBUG]-[VIEWMODEL] []: [deinit] [\(self)]")
    }
    
    /*
     func onAppear() {
         Task {
             do {
                 let image1 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image1)
                 })
                 
                 
                 let image2 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image2)
                 })
                 
                 let image3 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image3)
                 })
                 
                 let image4 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image4)
                 })
             } catch {
                 print(error.localizedDescription)
             }
         }
     }
     */
    
    /*
     func onAppear() {
         Task {
             do {
                 let image1 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image1)
                 })
                 
                 
                 let image2 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image2)
                 })
             } catch {
                 print(error.localizedDescription)
             }
         }
         
         Task {
             do {
                 let image3 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image3)
                 })
                 
                 let image4 = try await fetchImage()
                 await MainActor.run(body: {
                     self.data.append(image4)
                 })
             } catch {
                 print(error.localizedDescription)
             }
         }
     }
     */
    
    func onAppear() {
        Task {
            do {
                async let fetchImage1 = fetchImage()
                async let fetchImage2 = fetchImage()
                async let fetchImage3 = fetchImage()
                async let fetchImage4 = fetchImage()
                
                let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)
                
                await MainActor.run(body: {
                    self.data.append(contentsOf: [image1, image2, image3, image4])
                })
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func onDisappear() {}
    
    //  MARK: - API Calls
    func fetchImage() async throws -> UIImage {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else {
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
}
