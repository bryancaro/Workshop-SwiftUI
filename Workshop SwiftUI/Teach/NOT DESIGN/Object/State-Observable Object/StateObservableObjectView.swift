//
//  ObservableObjectView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

struct StateObservableObjectView: View {
    //  MARK: - Environment
    @EnvironmentObject private var environmentApp: EnvironmentViewModel
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
//    @StateObject
    @ObservedObject
    private var vm = StateObservableObjectViewModel()
    
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                FirstComponent
                
                Divider()
                    .padding(.vertical, 50)
                
                SecondComponent
            }
        }
        .onAppear(perform: vm.onAppear)
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension StateObservableObjectView {}

//  MARK: - Local Components
extension StateObservableObjectView {
    private var FirstComponent: some View {
        VStack {
            Text("Published")
                .font(.body.weight(.heavy))
            
            Text("Count is: \(vm.count)")
                .font(.title.weight(.bold))
            
            Button(action: vm.incrementCounter) {
                Text("Count is: \(vm.count)")
                    .font(.body.weight(.bold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .frame(height: 40)
            .background(Color.blue)
            .mask(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 5)
        }
    }
    
    private var SecondComponent: some View {
        VStack {
            Text("objectWillChange")
                .font(.body.weight(.heavy))
            
            Text("Count is: \(vm.countSignal)")
                .font(.title.weight(.bold))
            
            Button(action: vm.incrementCounterWithSignal) {
                Text("Count is: \(vm.countSignal)")
                    .font(.body.weight(.bold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .frame(height: 40)
            .background(Color.blue)
            .mask(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 5)
        }
    }
    
    private var EnvironmentComponent: some View {
        VStack {
            Text("Environment Example:")
                .font(.body.weight(.bold))
            
            Text(environmentApp.getRandomUUID())
                .font(.caption2.weight(.regular))
        }
    }
}

//  MARK: - Preview
struct StateObservableObjectView_Previews: PreviewProvider {
    static var previews: some View {
        StateObservableObjectView()
            .environmentObject(EnvironmentViewModel())
    }
}
