//
//  MeetingsApp.swift
//  Shared
//
//  Created by Cameron Grigoriadis on 4/7/22.
//

import SwiftUI

@main
struct MeetingsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
