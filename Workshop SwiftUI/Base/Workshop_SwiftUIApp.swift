//
//  Workshop_SwiftUIApp.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

@main
struct Workshop_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            //  MARK: -------- NOT DESIGN --------
            //  MARK:         CONCURRENCY
            //            AsyncAwaitView()
            //            TaskCancelMainView()
            //            AsyncLetView()
            //            ActorsView()
            //  MARK:         OBJECTS
            //            StateObservableObjectView()
            //  MARK:         REPRESENTABLE AND HOSTING
            //            LoginView()
            //  MARK:         WIDGET
            //  MARK:         CORE MOTION
            //            CoreMotionView()
            
            //  MARK: -------- DESIGN --------
            //  MARK:         STYLEGUIDE - DARKMODE
            //            StyleGuideView()
            //  MARK:         TRANSITIONS
            //            TransitionView()
            //            MatchGeometryView()
            //  MARK:         DYNAMIC TEXT
            //            DynamicTextView()
            //  MARK:         ACCESSIBILITY AND VOICEOVER
            //            AccessibilityView()
            //  MARK: -------- PRACTICE --------
            ContentView()
        }
    }
}
