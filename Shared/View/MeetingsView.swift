//
//  MeetingsView.swift
//  MeetingLink
//
//  Created by Cameron Grigoriadis on 11/20/23.
//

import SwiftUI
import SwiftData

struct MeetingsView: View {
    @Query private var meetings: [ZoomMeeting]
    @State private var showSheet = false
    
    private let columns: [GridItem] = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(meetings) { meeting in
                    MeetingButton(meeting: meeting)
                }
                if meetings.isEmpty {
                    MeetingsEmptyView()
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200)
                }
            }
            .padding()
        }
        .toolbar {
            Button("Settings", systemImage: "gearshape") {
                showSheet = true
            }
            .sheet(isPresented: $showSheet) {
                SettingsView()
            }
        }
    }
}

#Preview {
    MeetingsView()
}
