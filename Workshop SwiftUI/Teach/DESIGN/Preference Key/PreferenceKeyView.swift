//
//  PreferenceKeyView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 23/11/22.
//

import SwiftUI

/*
 Childs has value that the parent does not
 Thats why we use preference
 */

struct PreferenceKeyView: View {
    //  MARK: - (Binding-State) variables
    @State private var title = "First title"
    @State private var showSecondView = false
    //  MARK: - Principal View
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image("Background 2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 350, height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .softShadowV1()
                    
                    SecondPreferenceKeyView()
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle(title)
            .onPreferenceChange(CustomNavigationTitlePreferenceKey.self) { value in
                title = value
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Preview
struct PreferenceKeyView_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyView()
    }
}


//  MARK: - Preferences Key
struct CustomNavigationTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = "First title"
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

//  MARK: - Extension View to Preferences Key
extension View {
    func customNavTitle(_ title: String) -> some View {
        preference(key: CustomNavigationTitlePreferenceKey.self, value: title)
    }
}

//  MARK: - Second View
struct SecondPreferenceKeyView: View {
    //  MARK: - (Binding-State) variables
    @State private var title = ""
    //  MARK: - Principal View
    var body: some View {
        VStack {
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 350, height: 350)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .softShadowV1()
                .customNavTitle(title)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                title = "Space Title"
            })
        }
    }
    //  MARK: - Properties
}
