//
//  QATARView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 24/11/22.
//

import SwiftUI

struct QATARView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @Namespace private var namespace
    @State private var show = false
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                if !show {
                    WorldCupView(show: $show, namespace: namespace)
                        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                }
            }
            
            if show {
                WinnerView(show: $show, namespace: namespace)
                    .zIndex(1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            NavigationBar(hasScrolled: .constant(false), title: "QATAR")
                .opacity(show ? 0 : 1)
        )
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension QATARView {}

//  MARK: - Local Components
extension QATARView {}

//  MARK: - Preview
struct QATARView_Previews: PreviewProvider {
    static var previews: some View {
        QATARView()
    }
}
