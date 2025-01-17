//
//  Damnn_Vulnerable_MacOS_ApplicationApp.swift
//  Damnn Vulnerable MacOS Application
//
//  Created by Vaibhav Lakhani on 26/12/24.
//

import SwiftUI

@main
struct Damnn_Vulnerable_MacOS_ApplicationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
