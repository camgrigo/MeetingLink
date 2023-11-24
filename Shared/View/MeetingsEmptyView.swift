//
//  MeetingsEmptyView.swift
//  MeetingLink
//
//  Created by Cameron Grigoriadis on 11/22/23.
//

import SwiftUI

struct MeetingsEmptyView: View {
    var body: some View {
        VStack {
            Text("You're one tap away…")
                .font(.title)
                .padding(.bottom)
            Text("Tap the '+' button to add a new meeting.")
                .font(.headline)
        }
    }
}
