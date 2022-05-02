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
    
    @State private var meeting: Meeting?
    
    var body: some Scene {
        WindowGroup {
            if let meeting = meeting {
                NavigationView {
                    ContentView(meeting: meeting)
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                }
                .navigationViewStyle(.stack)
            } else {
                VStack {
                    ProgressView("Loading…")
                }.onAppear {
                    let settingsFetch = Settings(context: persistenceController.container.viewContext)
                    
                    let fetch = Meeting.fetchRequest()
                    
                    let meetings = try! PersistenceController.shared.container.viewContext.fetch(fetch)
                    
                    if let first = meetings.first {
                        meeting = first
                        
                    } else {
                        let m = Meeting(context: persistenceController.container.viewContext)
                        m.id = UUID().uuidString
                        try! persistenceController.container.viewContext.save()
                        meeting = m
                    }
                }
            }
        }
    }
    
}
