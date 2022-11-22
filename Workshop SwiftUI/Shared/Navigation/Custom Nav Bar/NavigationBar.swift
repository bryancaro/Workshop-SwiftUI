//
//  NavigationBar.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 16/11/22.
//

import SwiftUI

struct NavigationBar: View {
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @Binding var hasScrolled: Bool
    //  MARK: - Variables
    var title: String
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 10)
                .opacity(hasScrolled ? 1 : 0)
            
            Text(title)
                .font(.system(size: hasScrolled ? 22 : 34, weight: .bold))
                .font(.largeTitle.weight(.bold))
//                .animateFont(size: hasScrolled ? 22 : 34, weight: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
                .padding(.top, 20)
                .offset(y: hasScrolled ? -4 : 0)
            
            Image("O2O Logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 26, height: 26)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 44, height: 44)
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 20))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
        .frame(height: hasScrolled ? 44 : 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension NavigationBar {}

//  MARK: - Local Components
extension NavigationBar {}

//  MARK: - Preview
struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            NavigationBar(hasScrolled: .constant(false), title: "Rockets")
        }
    }
}
