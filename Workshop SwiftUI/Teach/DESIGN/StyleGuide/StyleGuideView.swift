//
//  StyleGuideView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 22/11/22.
//

import SwiftUI

struct StyleGuideView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @State var hide = false
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ScrollView {
                Spacer()
                    .frame(height: 100)
                
                VStack(spacing: 50) {
                    Group {
                        FontComponent
                        
                        Divider()
                        
                        ShadowComponent
                        
                        Divider()
                        
                        ModifierComponent
                        
                        Divider()
                        
                        ForegroundToolComponent
                    }
                    
                    Divider()
                    
                    Group {
                        BackgroundToolComponent
                        
                        Divider()
                        
                        ClipShapeToolComponent
                        
                        Divider()
                        
                        MaskToolComponent
                        
                        Divider()
                        
                        OverlayToolComponent
                    }
                }
                
                Spacer()
                    .frame(height: 100)
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension StyleGuideView {}

//  MARK: - Local Components
extension StyleGuideView {
    private var FontComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("Normal font")
                    .font(.body.weight(.bold))
                
                Text("Wecome iOS Developers")
                    .font(.body)
            }
            
            VStack(spacing: 5) {
                Text("Custom font")
                    .font(.body.weight(.bold))
                
                Text("Wecome iOS Developers")
                    .customFont(size: .large, weight: .regular)
            }
        }
    }
    
    private var ShadowComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("Normal Shadow")
                    .font(.body.weight(.bold))
                
                Image("O2O Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .shadow(color: Color.black.opacity(0.5), radius: 40, x: 0, y: 20)
            }
            
            VStack(spacing: 5) {
                Text("Custom Shadow")
                    .font(.body.weight(.bold))
                
                Image.O2OLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    .softShadowV1()
            }
        }
    }
    
    private var ModifierComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("With Out Modifier")
                    .font(.body.weight(.bold))
                
                Text("Working".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .frame(height: 35)
                    .background(Color.blue.opacity(1))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
            
            VStack(spacing: 5) {
                Text("With Modifier")
                    .font(.body.weight(.bold))
                
                Text("Working".uppercased())
                //                            .modifier(BadgeTextModifier())
                    .badgeStyle()
            }
        }
    }
    
    private var BackgroundToolComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("Background Tool")
                    .font(.body.weight(.bold))
                
                Text("Hello World")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.blue)
                    )
            }
        }
    }
    
    private var ClipShapeToolComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("ClipShape Tool")
                    .font(.body.weight(.bold))
                
                Text("Hello World")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 15)
                        //                                    .fill(.blue) // ERROR
                    )
            }
        }
    }
    
    private var MaskToolComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("Mask Tool")
                    .font(.body.weight(.bold))
                
                Text("Hello World")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .mask(
                        RoundedRectangle(cornerRadius: 15)
                    )
                
                Image("Background 1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .mask(
                        Text("Hello WORLD")
                            .font(.largeTitle.bold())
                    )
                
                /*
                 
                 **EXPLICAR EL MASK EN FIGMA**
                 
                 The mask() modifier is different from clipShape(), because it also applies any transparency from the masking view – you get to have holes in your underlying view based on the transparency of your mask. On the other hand, clipShape() only adjusts the outside shape of the view you apply it to.
                 */
            }
        }
    }
    
    private var OverlayToolComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("Overlay Tool")
                    .font(.body.weight(.bold))
                
                Image("Background 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .cornerRadius(15)
                //                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    .overlay(
                        Text("Hello WORLD".uppercased())
                            .foregroundColor(.red)
                            .bold()
                        // Explicar con spacer y esas cosas
                    )
            }
        }
    }
    
    private var ForegroundToolComponent: some View {
        VStack(spacing: 50) {
            VStack(spacing: 5) {
                Text("Foreground")
                    .font(.body.weight(.bold))
                
                Text("ARGENTINA SOCCER TEAM".uppercased())
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.blue)
            }
            
            VStack(spacing: 5) {
                Text("ForegroundStyle iOS 15")
                    .font(.body.weight(.bold))
                
                Text("BRASIL SOCCER TEAM".uppercased())
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(
                        .linearGradient(Gradient(colors: [.green, .yellow, .green]), startPoint: .top, endPoint: .bottom)
                    )
            }
        }
    }
    
}

//  MARK: - Preview
struct StyleGuideView_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideView()
    }
}
