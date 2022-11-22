//
//  CoreMotionView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 15/11/22.
//

import SwiftUI

struct CoreMotionView: View {
    @StateObject private var vm = CoreMotionViewModel()
    //  MARK: - Principal View
    var body: some View {
        ZStack {
//            Color.sys.edgesIgnoringSafeArea(.all)
            
            Image("challenge_4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(32)
                .blur(radius: 5)
                .offset(y: 10)
                .opacity(0.9)
                .frame(width: UIScreen.main.bounds.width - 50)
                .overlay(
                    Image("challenge_4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .parallaxEffect(multiplier: 30)
                )
        }
        .animation(.interactiveSpring(), value: UUID())
    }
}

//  MARK: - Actions
extension CoreMotionView {}

//  MARK: - Local Components
extension CoreMotionView {}

//  MARK: - Preview
struct CoreMotionView_Previews: PreviewProvider {
    static var previews: some View {
        CoreMotionView()
    }
}



//  MARK: - Extension
extension View {
    func parallaxEffect(multiplier: CGFloat) -> some View {
        self
            .modifier(ParallaxMotionModifier(multiplier: multiplier))
    }
}

struct ParallaxMotionModifier: ViewModifier {
    @StateObject var vm = CoreMotionViewModel()
    
    var multiplier: CGFloat
    
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 30, x: -vm.x * multiplier, y: -vm.y * multiplier)
            .offset(x: vm.x * multiplier, y: vm.y * multiplier)
            .rotation3DEffect(Angle(degrees: 2), axis: (x: -vm.y * multiplier, y: -vm.x * multiplier, z: 0))
    }
}
