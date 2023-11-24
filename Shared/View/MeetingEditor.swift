//
//  MeetingEditor.swift
//  MeetingLink (iOS)
//
//  Created by Cameron Grigoriadis on 11/23/23.
//

import SwiftUI

struct MeetingEditor: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @Binding var urlInput: String
    @Binding var meetingName: String
    
    private var isValid: Bool { !meetingName.isEmpty && !urlInput.isEmpty }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Zoom Meeting", text: $meetingName)
                    TextField("zoom.us", text: $urlInput)
                        .keyboardType(.URL)
                }
            }
            .navigationTitle(meetingName)
            .toolbar {
                ToolbarItem {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem {
                    Button("Done") {
                        if let url = URL(string: urlInput) {
                            modelContext.insert(ZoomMeeting(name: meetingName, baseURL: url))
                        }
                        dismiss()
                    }
                    .bold()
                    .disabled(!isValid)
                }
            }
        }
    }
}
