//
//  MatchGeometryView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 24/11/22.
//

import SwiftUI

/*
 Es complicado su uso
 Animate geometry shape
 Es decirle al sistema que dos views separados son el mismo view
 */

struct MatchGeometryView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @State private var normalShappedClicked = false
    @State private var offsetShappedClicked = false
    @State private var shappedClicked = false
    @Namespace private var namespace
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
//            SpacerMatch
            
//            OffsetMatch
            
            MatchGeometryEffect
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension MatchGeometryView {}

//  MARK: - Local Components
extension MatchGeometryView {
    private var SpacerMatch: some View {
        ZStack {
            //  PUEDE CREAR CONFLICTOS CON OTROS COMPONENTES POR USAR SPACER
            VStack {
                if normalShappedClicked {
                    Spacer()
                }
                
                Image("O2O Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .mask(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 15)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            normalShappedClicked.toggle()
                        }
                    }
                
                if !normalShappedClicked {
                    Spacer()
                }
            }
        }
    }
    
    private var OffsetMatch: some View {
        ZStack {
            //  PUEDE CREAR CONFLICTOS CON OTROS COMPONENTES POR USAR SPACER
            VStack {
                Image("O2O Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .mask(RoundedRectangle(cornerRadius: 15))
                    .shadow(radius: 15)
                    .offset(y: offsetShappedClicked ? screen.height * 0.7 : 0)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            offsetShappedClicked.toggle()
                        }
                    }
                
                    Spacer()
            }
        }
    }
    
    private var MatchGeometryEffect: some View {
        ZStack {
/*
 PARA EXPLICAR RECUERDA QUITAR PRIMERO LOS MATCHGEOMETRY
 */
            VStack {
                if shappedClicked {
                    Image("O2O Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 15)
                        .matchedGeometryEffect(id: "logo", in: namespace)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                shappedClicked.toggle()
                            }
                        }
                }
                
                Spacer()
                
                if !shappedClicked {
                    Image("O2O Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 15)
                        .matchedGeometryEffect(id: "logo", in: namespace)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                shappedClicked.toggle()
                            }
                        }
                }
                
            }
        }
    }
}

//  MARK: - Preview
struct MatchGeometryView_Previews: PreviewProvider {
    static var previews: some View {
        MatchGeometryView()
    }
}
