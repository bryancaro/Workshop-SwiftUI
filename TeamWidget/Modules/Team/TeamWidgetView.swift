//
//  TeamWidgetEntryView.swift
//  TeamWidgetExtension
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI
import WidgetKit

struct TeamWidgetView: View {
    //  MARK: - Environment
    @Environment(\.widgetFamily) var widgetFamily
    //  MARK: - Observed Object
    //  MARK: - (Binding-State) variables
    //  MARK: - Variables
    var entry: Provider.Entry
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            switch widgetFamily {
            case .systemSmall:
                TeamWidgetSmallView(entry: entry)
            case .systemLarge:
                TeamWidgetLargeView(entry: entry)
            default:
                Text("Not implemented!")
            }
        }
    }
    //  MARK: - Properties
}

//  MARK: - Actions
extension TeamWidgetView {}

//  MARK: - Local Components
extension TeamWidgetView {}

//  MARK: - Preview
struct TeamWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        TeamWidgetSmallView(entry: TeamEntry(date: Date(), developers: ["👨‍💻 Bryan Caro", "👨‍💻 Stephany Caro"], developer: "👨‍💻 Bryan Caro"))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}
