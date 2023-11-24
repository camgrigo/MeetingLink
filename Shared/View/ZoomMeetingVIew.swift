//
//  ZoomMeetingVIew.swift
//  MeetingLink (iOS)
//
//  Created by Cameron Grigoriadis on 11/23/23.
//
import SwiftUI

struct ZoomMeetingView: View {
    let meeting: ZoomMeeting
    @State private var meetingName = String()
    @State private var urlInput = String()
    
    private var urlIsValid: Bool { URL(string: urlInput) != nil }
    
    var body: some View {
        VStack {
            TextField("Zoom Meeting", text: $meetingName, onCommit: { meeting.name = meetingName })
            TextField("zoom.us", text: $urlInput, onCommit: {
                if let url = URL(string: urlInput) {
                    meeting.baseURL = url
                }
            })
            .keyboardType(.URL)
            .foregroundStyle(urlIsValid ? Color.primary : Color.red)
            ShareLink(item: meeting, preview: SharePreview("A meeting has been shared with you. Tap to save:"))
        }
        .navigationBarTitle(meeting.name)
        .task {
            meetingName = meeting.name
            urlInput = meeting.baseURL.absoluteString
        }
    }
}
