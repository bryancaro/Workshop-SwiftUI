//
//  ContinuationView.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

struct ContinuationView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @StateObject private var vm = ContinuationViewModel()
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: Color.black.opacity(0.4), radius: 12, x: 20, y: 20)
            }
        }
        .onAppear(perform: vm.onAppear)
        .onDisappear(perform: vm.onDisappear)
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension ContinuationView {}

//  MARK: - Local Components
extension ContinuationView {}

//  MARK: - Preview
struct ContinuationView_Previews: PreviewProvider {
    static var previews: some View {
        ContinuationView()
    }
}
