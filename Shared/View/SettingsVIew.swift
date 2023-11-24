//
//  SettingsView.swift
//  MeetingLink (iOS)
//
//  Created by Cameron Grigoriadis on 11/23/23.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var notificationsEnabled = true
    @Query private var meetings: [ZoomMeeting]
    @State private var showSheet = false
    
    @State private var urlInput = String()
    @State private var meetingName = "Zoom Meeting"

    var body: some View {
        NavigationView {
            List {
                ForEach(meetings, id: \.id) { meeting in
                    NavigationLink(destination: ZoomMeetingView(meeting: meeting)) {
                        Text(meeting.name)
                    }
                }
                .onDelete(perform: deleteMeeting)
                Button("New Meeting", systemImage: "plus") {
                    showSheet = true
                }
                .sheet(isPresented: $showSheet) {
                    MeetingEditor(urlInput: $urlInput, meetingName: $meetingName)
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button("Done") {
                    // Save settings or perform any necessary actions
                    dismiss()
                }
            )
        }
    }

    private func deleteMeeting(at offsets: IndexSet) {
        offsets.forEach { modelContext.delete(meetings[$0]) }
    }
}
