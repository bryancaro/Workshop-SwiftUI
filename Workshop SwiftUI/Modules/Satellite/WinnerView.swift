//
//  WinnerView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 24/11/22.
//

import SwiftUI

struct WinnerView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @Binding var show: Bool
    //  MARK: - Variables
    var namespace: Namespace.ID
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    VStack {
                        Spacer()
                    }
                    .frame(height: 450)
                    .frame(maxWidth: .infinity)
                    .background(
                        Image("FIFA")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .matchedGeometryEffect(id: "image", in: namespace)
                    )
                    .mask(
                        RoundedRectangle(cornerRadius: 30)
                            .matchedGeometryEffect(id: "mask", in: namespace)
                    )
                    .overlay(
                        VStack {
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("Play your own FIFA World Cup")
                                    .font(.body.weight(.bold))
                                    .foregroundColor(.black)
                                    .matchedGeometryEffect(id: "title", in: namespace)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Can Argentina win the cup in FIFA big event?")
                                    .font(.caption2.weight(.regular))
                                    .foregroundColor(.blue)
                                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(20)
                            .background(
                                Rectangle()
                                    .fill(.ultraThinMaterial)
                                    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                    .matchedGeometryEffect(id: "blur", in: namespace)
                            )
                            .padding(20)
                            .offset(y: 50)
                        }
                    )
                    
                    VStack {
                        Image("AFA")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                        
                        Text("Winner of FIFA World Cup")
                            .font(.body.weight(.bold))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 100)
                    
                    Spacer()
                        .frame(height: 1000)
                }
                
            }
            
            BackButtonComponent
        }
        .edgesIgnoringSafeArea(.vertical)
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension WinnerView {
    func backButtonAction() {
        withAnimation(.spring()) {
            show = false
        }
    }
}

//  MARK: - Local Components
extension WinnerView {
    private var BackButtonComponent: some View {
        Button(action: backButtonAction) {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundStyle(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .padding(.top, 20)
    }
}

//  MARK: - Preview
struct WinnerView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        WinnerView(show: .constant(true), namespace: namespace)
    }
}
