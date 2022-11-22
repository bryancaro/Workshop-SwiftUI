//
//  EnvironmentView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

struct EnvironmentView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @StateObject private var vm = EnvironmentViewModel()
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            TabView {
                StateObservableObjectView()
            }
        }
        .onAppear(perform: vm.onAppear)
        .environmentObject(vm)
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension EnvironmentView {}

//  MARK: - Local Components
extension EnvironmentView {}

//  MARK: - Preview
struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView()
    }
}
