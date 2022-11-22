//
//  TeamWidget.swift
//  TeamWidget
//
//  Created by Bryan Caro on 9/11/22.
//

import WidgetKit
import SwiftUI

//  MARK: - Provider
struct Provider: TimelineProvider {
    typealias Entry = TeamEntry
    
    @Binding var developers: [String]
    @Binding var developer: String
    
    // Provides a timeline entry representing a placeholder version of the widget.
    func placeholder(in context: Context) -> TeamEntry {
        TeamEntry(date: Date(), developers: ["👨‍💻 Loading..."], developer: "👨‍💻 Loading...")
    }
    
    // Provides a timeline entry that represents the current time and state of a widget.
    //  THIS IS THE VIEW WHEN YOU ARE IN THA WIDGET GALLERY
    func getSnapshot(in context: Context, completion: @escaping (TeamEntry) -> ()) {
        let data = Date()
        let entry: TeamEntry
        
        if context.isPreview && (developers.isEmpty && developer.isEmpty) {
            entry = TeamEntry(date: Date(), developers: ["👨‍💻 iOS Dev"], developer: "👨‍💻 iOS Dev")
        } else {
            entry = TeamEntry(date: Date(), developers: developers, developer: developer)
        }
        
        completion(entry)
    }
    
    // Provides an array of timeline entries for the current time and, optionally, any future times to update a widget.
    //  THIS METHOD WORKS FOR UPDATE YOUR WIDGET
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var date: Date = Date()
        var entries: [TeamEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = TeamEntry(date: entryDate, developers: developers, developer: developer)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}


//  MARK: - Widget Configuration
struct TeamWidget: Widget {
    let kind: String = "TeamWidget"
    @StateObject private var vm = TeamWidgetViewModel()
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(developers: $vm.data, developer: $vm.person)) { entry in
            TeamWidgetView(entry: entry)
        }
        .configurationDisplayName("O2O Team Widget")
        .description("Easily check the O2O iOS Team")
        .supportedFamilies([.systemSmall, .systemLarge])
    }
}


