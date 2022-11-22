//
//  MatchedView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 20/11/22.
//

import SwiftUI

struct MatchedView: View {
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @Namespace var namespace
    @State var show = false
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            if !show {
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    
                    Text("SwiftUI")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .matchedGeometryEffect(id: "title", in: namespace)
                    
                    Text("20 sections - 3 hours".uppercased())
                        .font(.footnote.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .matchedGeometryEffect(id: "subtitle", in: namespace)

                    Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                        .font(.footnote.weight(.regular))
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 39)
                .frame(maxWidth: .infinity, maxHeight: 350, alignment: .leading)
                .background(
                    Image("Background 3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: namespace)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                        .matchedGeometryEffect(id: "mask", in: namespace)
                )
                .strokeStyle(cornerRadius: 30)
                .padding(.horizontal, 20)
            } else {
                ScrollView {
                    VStack {
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 390)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 39)
                    .overlay(
                        VStack(alignment: .leading, spacing: 8) {
                            Spacer()
                            
                            Text("SwiftUI")
                                .font(.largeTitle.weight(.bold))
                                .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .matchedGeometryEffect(id: "title", in: namespace)
                            
                            Text("20 sections - 3 hours".uppercased())
                                .font(.footnote.weight(.semibold))
                                .foregroundStyle(.secondary)
                                .matchedGeometryEffect(id: "subtitle", in: namespace)
                            
                            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                                .font(.footnote.weight(.regular))
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                                .matchedGeometryEffect(id: "text", in: namespace)
                        }
                        
                    )
                    .background(
                        Image("Background 3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "background", in: namespace)
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                    )
                    .strokeStyle(cornerRadius: 30)
                }
                
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension MatchedView {}

//  MARK: - Local Components
extension MatchedView {}

//  MARK: - Preview
struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
