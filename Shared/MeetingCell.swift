//
//  MeetingCell.swift
//  Meetings
//
//  Created by Cameron Grigoriadis on 8/12/23.
//

import SwiftUI

struct MeetingCell: View {
    let meeting: Meeting
    
    var body: some View {
        HStack {
            Text(meeting.name ?? "Meeting")
                .font(.system(.title, design: .rounded))
            Spacer()
            phoneIcon
        }
        .padding()
        .background(background)
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.blue)
    }
    
    private var phoneIcon: some View {
        Image(systemName: "phone.circle.fill")
            .symbolRenderingMode(.palette)
            .foregroundStyle(.blue, .white)
            .font(.largeTitle)
    }
}

extension Meeting {
    func join() {
        if let urlString, let zoomLink = URL(string: urlString), UIApplication.shared.canOpenURL(AppURL.zoom) {
            UIApplication.shared.open(zoomLink)
        }
    }
}
