//
//  EditModeButton.swift
//  Meetings
//
//  Created by Cameron Grigoriadis on 8/13/23.
//

import SwiftUI

struct EditModeButton: View {
    @Binding var isEditing: Bool
    
    var body: some View {
        if isEditing {
            Button(action: toggle) {
                Label("Save", systemImage: "checkmark")
                    .font(.system(.body, design: .rounded).weight(.semibold))
                    .labelStyle(.titleAndIcon)
            }
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
        } else {
            Button(action: toggle) {
                HStack {
                    Text("Edit")
                        .font(.system(.body, design: .rounded).weight(.semibold))
                    Image(systemName: "gearshape.fill")
                }
                    .labelStyle(.titleAndIcon)
            }
            .buttonBorderShape(.capsule)
            .buttonStyle(.bordered)
        }
    }
    
    private func toggle() {
        withAnimation { isEditing.toggle() }
    }
}

#Preview {
    EditModeButton(isEditing: .constant(false))
}
