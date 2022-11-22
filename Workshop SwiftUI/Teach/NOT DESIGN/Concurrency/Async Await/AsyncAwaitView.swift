//
//  AsyncAwaitView.swift
//  AsyncAwait
//
//  Created by Bryan Caro on 6/11/22.
//

import SwiftUI

struct AsyncAwaitView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @StateObject private var vm = AsyncAwaitViewModel()
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(vm.data, id: \.self) { data in
                        Text(data)
                    }
                }
            }
        }
        .onAppear(perform: vm.onAppear)
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension AsyncAwaitView {}

//  MARK: - Local Components
extension AsyncAwaitView {}

//  MARK: - Preview
struct AsyncAwaitView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwaitView()
    }
}
