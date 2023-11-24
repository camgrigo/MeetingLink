//
//  MeetingButton.swift
//  MeetingLink (iOS)
//
//  Created by Cameron Grigoriadis on 11/23/23.
//

import SwiftUI

struct MeetingButton: View {
    @Environment(\.openURL) var openURL
    let meeting: ZoomMeeting
    
    var body: some View {
        Button {
            print(meeting.url)
            openURL(meeting.url)
        } label: {
            MeetingCardView(meeting: meeting)
        }
    }
}
