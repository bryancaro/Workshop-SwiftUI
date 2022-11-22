//
//  StateObjectView.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

struct UpdatingExampleView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    @State private var data: String = ""
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                StateObservableObjectView()
                
                Divider()
                    .padding(.vertical, 50)
                
                FirstComponent
                
                Divider()
                    .padding(.vertical, 50)
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension UpdatingExampleView {
    private func generateData() {
        data = UUID().uuidString
    }
}

//  MARK: - Local Components
extension UpdatingExampleView {
    private var FirstComponent: some View {
        VStack {
            Text("Updating Example View")
                .font(.body.weight(.heavy))
            
            Text(data)
                .font(.footnote.weight(.bold))
                .padding(.vertical)
            
            Button(action: generateData) {
                Text("Generate")
                    .font(.body.weight(.bold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .frame(height: 40)
            .background(Color.red)
            .mask(RoundedRectangle(cornerRadius: 8))
            .shadow(radius: 5)
        }
    }
}

//  MARK: - Preview
struct UpdatingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatingExampleView()
    }
}
