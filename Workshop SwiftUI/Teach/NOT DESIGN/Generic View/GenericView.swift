//
//  GenericView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 23/11/22.
//

import SwiftUI

struct GenericView: View {
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                Text("Generic Views")
                    .font(.body.weight(.bold))
                
                HeaderWithOutBuilderView(title: "This is a generic component View with out ViewBuilder",
                                         content:
                                            Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                )
                
                HeaderWithBuilderView(title: "This is a generic component View with ViewBuilder") {
                    HStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

//  MARK: - Preview
struct GenericView_Previews: PreviewProvider {
    static var previews: some View {
        GenericView()
    }
}

struct HeaderWithOutBuilderView<Content: View>: View {
    var title: String
    let content: Content
    
    var body: some View {
        ZStack {
            VStack {
                Text(title)
                    .font(.body.weight(.bold))
                    .multilineTextAlignment(.center)
                
                content
            }
        }
    }
}

struct HeaderWithBuilderView<Content: View>: View {
    var title: String
    let content: Content
    
    init(title: String, @ViewBuilder _ content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text(title)
                    .font(.body.weight(.bold))
                    .multilineTextAlignment(.center)
                
                content
            }
        }
    }
}
