//
//  Readme.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import Foundation

/*
 @StateObject vs. @ObservedObject

Def     : Tell a SwiftUI view to update in response to changes from an observed object.
Problem : Both wrappers look similar but have an essential distinction to be aware of when building apps in SwiftUI.
 
 SIMILAR
 - Both property wrappers require your object to conform to the ObservableObject protocol.
 
 DIFFERENCE
 - Observed objects marked with the @StateObject property wrapper don’t get destroyed and re-instantiated at times their containing view struct update.
 
 
 
 WHEN SHOULD I USE @StateObject?
 Use the state object property wrapper to ensure consistent results when the current view creates the observed object.

 WHEN SHOULD I USE @ObservedObject?
 Whenever you inject an observed object as a dependency, you can use the @ObservedObject.
 */
