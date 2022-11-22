//
//  DynamicTextView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 22/11/22.
//

import SwiftUI

struct DynamicTextView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                ForEach(0..<5) { data in
                    HStack(spacing: 30) {
                        Circle()
                            .fill(.black)
                            .frame(width: 25, height: 25)
                        
                        Text("Hello O2O DEVELOPER ")
                            .font(.custom("BebasNeue-Regular", size: 50))
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .frame(maxWidth: .infinity, alignment: .leading)

//                            .customO2OFont(size: 22)
                    }
                    .padding()
                    .frame(width: screen.width, alignment: .leading)
                    .background(Color.white)
                    .softShadowV1()
                }
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
