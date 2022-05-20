//
//  SettingsView.swift
//  Meetings
//
//  Created by Cameron Grigoriadis on 8/12/23.
//

import SwiftUI

struct SettingsView: View {
    enum Field {
        case url
    }
    @FocusState var field: Field?
    
    @Environment(\.dismiss) var dismiss
    let meeting: Meeting
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    VStack(alignment: .leading) {
                        Label("Link", systemImage: "link")
                            .font(.headline)
                        HStack {
                            TextEditor(text: Binding { meeting.urlString ?? "" } set: {
                                meeting.urlString = $0
                                try! PersistenceController.shared.container.viewContext.save()
                            })
                            .onChange(of: meeting.urlString, perform: { newValue in
                                try! PersistenceController.shared.container.viewContext.save()
                            })
                            .focused($field, equals: .url)
                            .padding(.trailing)
                            Button {
                                meeting.urlString = ""
                            } label: {
                                Image(systemName: "xmark")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done").bold()
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        field = nil
                    }
                }
            }
        }
    }
}
