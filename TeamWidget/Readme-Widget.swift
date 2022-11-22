//
//  Readme-Widget.swift
//  TeamWidgetExtension
//
//  Created by Bryan Caro on 9/11/22.
//

import Foundation
/*
 1. WidgetKit may need to render the widget's content as a placeholder giving the user a general idea of what the widget shows, for example:
    -  while the actual data is loading in the background
    -  when we enable the Data Protection capability for the widget extension to hide sensitive information
    -  when a user chooses to display the placeholder in certain presentation contexts such as on the Lock Screen
 
 2. getSnapshot(in:completion:)
    -   WidgetKit calls this method when the widget appears in transient situations. The completion handler should be called as quickly as possible supplying sample data if the data for the widget's current state is not available yet.
 
 3. getTimeline(in:completion:)
    -   After requesting the initial snapshot, WidgetKit calls this method to request a regular timeline from the provider.
 
 
 
 
 
 */
