//
//  DynamicTextView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 22/11/22.
//

import SwiftUI

/*
 LOS TITULOS NO SON TAN IMPORTANTE PARA LOS DYNAMIC TEXT, YA QUE NORMALMENTE SON GRANDES. LOS IMPORTANTES SON LOS PEQUEÑOS TIPO BODY-FOOTNOTE
 */

struct DynamicTextView: View {
    //  MARK: - Environment
    @Environment(\.dynamicTypeSize) var sizeCategory
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack(spacing: 100) {
                ForEach(0..<2) { data in
                    VStack {
                        Text("Hello O2O DEVELOPER ")
                            .font(.custom("BebasNeue-Regular", size: 20))
                            .multilineTextAlignment(.center)
                            .frame(width: screen.width * 0.5)
                    }
                    .frame(width: screen.width * 0.5, height: 120, alignment: .leading)
                    .background(Color.white)
                    .softShadowV1()
                    .dynamicTypeSize(.xSmall ... .medium)
                }
                
                Text("Hello O2O DEVELOPER Hello O2O DEVELOPER Hello O2O DEVELOPER Hello O2O DEVELOPER Hello O2O DEVELOPER Hello O2O DEVELOPER ")
                    .font(.custom("BebasNeue-Regular", size: 20))
                    .lineLimit(sizeCategory > .large ? 1 : 3)
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension DynamicTextView {}

//  MARK: - Local Components
extension DynamicTextView {}

//  MARK: - Preview
struct DynamicTextView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView()
    }
}
