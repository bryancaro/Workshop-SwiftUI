//
//  WorldCupView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 24/11/22.
//

import SwiftUI

struct WorldCupView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @Binding var show: Bool
    //  MARK: - Variables
    var namespace: Namespace.ID
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("Play your own FIFA World Cup")
                        .font(.body.weight(.bold))
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Can Argentina win the cup in FIFA big event?")
                        .font(.caption2.weight(.regular))
                        .foregroundColor(.white)
                        .matchedGeometryEffect(id: "subtitle", in: namespace)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.black)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .blur(radius: 20)
                        .matchedGeometryEffect(id: "blur", in: namespace)
                )
            }
            .frame(width: screen.width * 0.8, height: 300)
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
            .onTapGesture(perform: cardTappedAction)
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension WorldCupView {
    func cardTappedAction() {
        withAnimation(.spring()) {
            show.toggle()
        }
    }
}

//  MARK: - Local Components
extension WorldCupView {}

//  MARK: - Preview
struct WorldCupView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        WorldCupView(show: .constant(true), namespace: namespace)
    }
}
