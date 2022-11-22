//
//  ChallengeView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 16/11/22.
//

import SwiftUI

struct ChallengeView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            CoreMotionView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            NavigationBar(hasScrolled: .constant(false), title: "Challenge")
        )
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension ChallengeView {}

//  MARK: - Local Components
extension ChallengeView {}

//  MARK: - Preview
struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
