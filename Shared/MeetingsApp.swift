//
//  MeetingsApp.swift
//  Shared
//
//  Created by Cameron Grigoriadis on 4/7/22.
//

import SwiftUI

struct AppURL {
    static let zoom = URL(string: "zoomus://")!
}

@main
struct MeetingsApp: App {
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            NavigationView {
                MeetingsView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
            .navigationViewStyle(.stack)
        }
    }
    
}
