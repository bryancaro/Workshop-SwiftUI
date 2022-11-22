//
//  LoginView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

struct LoginView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                FirstComponent
                
                Divider()
                    .padding(.vertical)
                
                LoginUIViewRepresentable()
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension LoginView {}

//  MARK: - Local Components
extension LoginView {
    private var FirstComponent: some View {
        VStack {
            Text("SwiftUI View")
                .font(.title2.weight(.bold))
            
            Image("O2O Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .shadow(radius: 5)
        }
    }
}

//  MARK: - Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
