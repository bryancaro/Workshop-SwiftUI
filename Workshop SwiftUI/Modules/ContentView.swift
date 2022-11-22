//
//  ContentView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 19/11/22.
//

import SwiftUI

struct ContentView: View {
    //  MARK: - Environment
    @AppStorage("selectedTab") var selectedTab: Tab = .rockets
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .rockets:
                    RocketsView()
                case .satellite:
//                    SatelliteView()
                    MatchedView()
                case .challenge:
                    ChallengeView()
                }
                
                TabBar()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .bottom, content: {
                Color.clear.frame(height: 80)
            })
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension ContentView {}

//  MARK: - Local Components
extension ContentView {}

//  MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
