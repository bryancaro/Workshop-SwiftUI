//
//  SatelliteView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 16/11/22.
//

import SwiftUI

struct SatelliteView: View {
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @State var hasScrolled = false
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ScrollView {
                GeometryReader { proxy in
                    Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
                }
                .frame(height: 0)
                .onPreferenceChange(ScrollPreferenceKey.self) { value in
                    withAnimation(.easeInOut) {
                        if value < 0 {
                            hasScrolled = true
                        } else {
                            hasScrolled = false
                        }
                    }
                }
                
               
                                
                Color.clear.frame(height: 1000)
            }
            .background(
                Image("Planet 6")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 1000, height: 1000)
                    .offset(x: 200, y: -200)
            )
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 80)
            })
            .overlay(
                NavigationBar(hasScrolled: $hasScrolled, title: "Satellites")
            )
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension SatelliteView {}

//  MARK: - Local Components
extension SatelliteView {}

//  MARK: - Preview
struct SatelliteView_Previews: PreviewProvider {
    static var previews: some View {
        SatelliteView()
    }
}
