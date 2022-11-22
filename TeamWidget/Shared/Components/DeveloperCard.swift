//
//  DeveloperCard.swift
//  TeamWidgetExtension
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI
import WidgetKit

struct DeveloperCard: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    var developer: String
    //  MARK: - Principal View
    var body: some View {
        HStack {
            Circle()
                .fill(.orange)
                .frame(width: 5, height: 5)
            
            Text(developer)
                .font(.caption)
                .minimumScaleFactor(0.1)
                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension DeveloperCard {}

//  MARK: - Local Components
extension DeveloperCard {}

//  MARK: - Preview
struct DeveloperCard_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperCard(developer: "👨‍💻 Bryan Caro")
            .previewContext(WidgetPreviewContext(family: .systemMedium))

    }
}
