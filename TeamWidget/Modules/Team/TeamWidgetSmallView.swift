//
//  TeamWidgetSmallView.swift
//  TeamWidgetExtension
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI
import WidgetKit

struct TeamWidgetSmallView: View {
    //  MARK: - Environment
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    var entry: Provider.Entry
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(.white)
            
            HeaderComponent
            
            DeveloperComponent
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension TeamWidgetSmallView {}

//  MARK: - Local Components
extension TeamWidgetSmallView {
    private var HeaderComponent: some View {
        VStack {
            Image("O2O Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
            
            Spacer()
        }
    }
    
    private var DeveloperComponent: Text {
        Text(entry.developer)
            .font(.body.weight(.bold))
    }
}

//  MARK: - Preview
struct TeamWidgetSmallView_Previews: PreviewProvider {
    static var previews: some View {
        TeamWidgetSmallView(entry: TeamEntry(date: Date(), developers: ["👨‍💻 Bryan Caro", "👨‍💻 Stephany Caro"], developer: "👨‍💻 Bryan Caro"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
