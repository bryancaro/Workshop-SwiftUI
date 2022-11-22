//
//  TeamWidgetLargeView.swift
//  TeamWidgetExtension
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI
import WidgetKit

struct TeamWidgetLargeView: View {
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
            
            VStack {
                HeaderComponent
                
                DevelopersComponent
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension TeamWidgetLargeView {}

//  MARK: - Local Components
extension TeamWidgetLargeView {
    private var HeaderComponent: some View {
        VStack {
            Image("O2O Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
        }
    }
    
    private var DevelopersComponent: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .leading) {
                ForEach(entry.developers, id: \.self) { developer in
                    DeveloperCard(developer: developer)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

//  MARK: - Preview
struct TeamWidgetLargeView_Previews: PreviewProvider {
    static var previews: some View {
        TeamWidgetLargeView(entry: TeamEntry(date: Date(), developers: ["👨‍💻 Bryan Caro", "👨‍💻 Stephany Caro"], developer: "👨‍💻 Bryan Caro"))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
