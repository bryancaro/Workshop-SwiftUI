//
//  TabBar.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 16/11/22.
//

import SwiftUI

struct TabBar: View {
    //  MARK: - Observed Object
    @AppStorage("selectedTab") var selectedTab: Tab = .rockets
    //  MARK: - (Binding-State) variables
    @State private var color: Color = .red
    @State private var tabItemWidth: CGFloat = 0
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            //  TAB BAR BUTTONS
            HStack {
                ForEach(tabItems) { item in
                    Button(action: { selectedTabAction(item) }) {
                        VStack(spacing: 5) {
                            Image(systemName: item.icon)
                                .font(.body.bold())
                                .frame(width: 48, height: 20)
                            
                            Text(item.name)
                                .font(.caption2)
                                .lineLimit(1)
                        }
                        .frame(maxWidth: .infinity)
                        .foregroundColor(selectedTab == item.selection ? .primary : .secondary)
                        .blendMode(selectedTab == item.selection ? .overlay : .normal)
                    }
                    .buttonStyle(.plain)
                    .overlay(
                        GeometryReader { proxy in
                            Color.clear
                                .preference(key: TabPreferenceKey.self, value: proxy.size.width)
                        }
                    )
                    .onPreferenceChange(TabPreferenceKey.self) { value in
                        tabItemWidth = value
                    }
                }
            }
            .padding(.top, 8)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
            //  SHADOW INDICATOR
            .background(
                HStack {
                    if selectedTab == .challenge { Spacer() }
                                        
                    Circle()
                        .fill(color)
                        .frame(width: tabItemWidth) // Figma frame es 44 pero se pronuncia mas el shadow con 88
                    
                    if selectedTab == .rockets { Spacer() }
                }
            )
            //  INDICATOR
            .overlay(
                HStack {
                    if selectedTab == .challenge { Spacer() }
                                        
                    Rectangle()
                        .fill(color)
                        .frame(width: 28, height: 5)
                        .cornerRadius(3)
                        .frame(width: tabItemWidth)
                        .frame(maxHeight: .infinity, alignment: .top)
                    
                    if selectedTab == .rockets { Spacer() }
                }
            )
            .strokeStyle(cornerRadius: 30)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension TabBar {
    func selectedTabAction(_ tab: TabItem) {
        withAnimation {
            selectedTab = tab.selection
            color = tab.color
        }
    }
}

//  MARK: - Local Components
extension TabBar {}

//  MARK: - Preview
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

/*
 Rockets picture = globe.americas.fill
 Satellite picture = bonjour
 Challenge picture = brain.head.profile
 
 *** Nativamente sin ser custom  ***
 TabView {
     Color.red
         .tabItem {
             Label("Home", systemImage: "house")
         }
     
     Color.blue
         .tabItem {
             Label("Profile", systemImage: "brain.head.profile")
         }
 }
 */
