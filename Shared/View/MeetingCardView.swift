//
//  MeetingCardView.swift
//  MeetingLink (iOS)
//
//  Created by Cameron Grigoriadis on 11/23/23.
//

import SwiftUI

struct MeetingCardView: View {
    let meeting: ZoomMeeting
    
    var body: some View {
        Text(meeting.name)
            .font(.system(.largeTitle, design: .rounded).bold())
            .frame(maxWidth: .infinity, minHeight: 300)
            .foregroundColor(.white)
            .shadow(radius: 2)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.accentColor.gradient)
            )
    }
}
