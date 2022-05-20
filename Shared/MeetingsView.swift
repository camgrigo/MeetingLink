//
//  MeetingsView.swift
//  Meetings
//
//  Created by Cameron Grigoriadis on 8/12/23.
//

import SwiftUI

struct MeetingsView: View {
    @State private var isEditing = false
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) private var meetings: FetchedResults<Meeting>
    @State private var isShowingSettings = false
    
    var body: some View {
        LazyVGrid(columns: [.init(.flexible(minimum: 200, maximum: 400))]) {
            ForEach(meetings, content: content)
            Spacer()
        }
        .padding()
        .navigationTitle(isEditing ? "Edit Mode" : "Meetings")
        .toolbar {
            ToolbarItem {
                EditModeButton(isEditing: $isEditing)
            }
        }
    }
    
    private func content(meeting: Meeting) -> some View {
        Button {
            if isEditing {
                isShowingSettings = true
            } else {
                meeting.join()
            }
        } label: {
            MeetingCell(meeting: meeting)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(meeting: meeting)
        }
    }
}
