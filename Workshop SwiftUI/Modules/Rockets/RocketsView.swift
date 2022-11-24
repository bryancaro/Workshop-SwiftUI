//
//  RocketsView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 16/11/22.
//

import SwiftUI

struct RocketsView: View {
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
                
                TabView {
                    ForEach(rockets) { rocket in
                        GeometryReader { proxy in
                            let value = proxy.frame(in: .global).minX
                            
                            RocketCard(rocket: rocket)
                                .padding(.vertical, 120)
                                .rotation3DEffect(Angle(degrees: value / -10), axis: (x: 0, y: 1, z: 0))
                                .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
                                .blur(radius: abs(value / 40))
                                .overlay(
                                    Image(rocket.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 350)
                                        .offset(y: -130)
                                        .offset(x: value / 2)
                                )

                            
//                            Text("\(value)")
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 600)
                                
                Color.clear.frame(height: 1000)
            }
            .background(
                Image("Planet 1")
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
                NavigationBar(hasScrolled: $hasScrolled, title: "Rockets")
            )
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension RocketsView {}

//  MARK: - Local Components
extension RocketsView {}

//  MARK: - Preview
struct RocketsView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsView()
    }
}
