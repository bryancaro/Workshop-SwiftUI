//
//  RocketCard.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 20/11/22.
//

import SwiftUI

struct RocketCard: View {
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    var rocket: Rocket
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                
                Text(rocket.title)
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
                
                Text(rocket.subtitle.uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.secondary)
                
                Text(rocket.text)
                    .font(.footnote.weight(.regular))
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 39)
            .frame(maxWidth: .infinity, maxHeight: 350, alignment: .leading)
            .background(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .strokeStyle(cornerRadius: 30)
            .padding(.horizontal, 20)
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension RocketCard {}

//  MARK: - Local Components
extension RocketCard {}

//  MARK: - Preview
struct RocketCard_Previews: PreviewProvider {
    static var previews: some View {
        RocketCard(rocket: rockets[0])
    }
}
