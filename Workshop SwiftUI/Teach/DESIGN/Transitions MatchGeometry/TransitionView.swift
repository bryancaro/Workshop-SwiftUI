//
//  AnimationDesignView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 24/11/22.
//

import SwiftUI

struct TransitionView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @State private var show = true
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Button(action: showAction) {
                    Text("Press me")
                        .font(.title.bold())
                        .foregroundColor(.white)
                        .padding()
                        .background(.black, in: RoundedRectangle(cornerRadius: 15))
                        .softShadowV1()
                }
            }
            
            if show {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.white)
                    .frame(width: 250, height: 250)
                    .softShadowV1()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                //                    .transition(.scale)
                //                    .transition(.opacity)
                //                    .transition(.move(edge: .top))
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .scale))
            }
            
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension TransitionView {
    private func showAction() {
        withAnimation(.spring()) {
            show.toggle()
        }
    }
}

//  MARK: - Local Components
extension TransitionView {}

//  MARK: - Preview
struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
