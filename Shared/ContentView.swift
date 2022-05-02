//
//  ContentView.swift
//  Shared
//
//  Created by Cameron Grigoriadis on 4/7/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var url: URL? {
        URL(string: "zoomus://")
    }
    
    @State private var isShowingSettings = false
    @State private var openLinkOnOpen = false
    
    @ObservedObject var meeting: Meeting
    
    enum Field {
        case url // id, passcode
    }
    @FocusState var field: Field?
    
    var body: some View {
        CallButton(action: openInZoom)
            .disabled(url == nil || meeting.urlString == nil || !UIApplication.shared.canOpenURL(url!))
            .padding()
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingSettings = true
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .sheet(isPresented: $isShowingSettings) {
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
//                                Section {
//                                    Toggle(isOn: $openLinkOnOpen) {
//                                        Text("Join Automatically")
//                                    }
//                                }
                            }
                            .navigationTitle("Settings")
                            .toolbar {
                                Button {
                                    isShowingSettings = false
                                } label: {
                                    Text("Done").bold()
                                }

                            }
                        }
                    }
                }
                ToolbarItem(placement: .keyboard) {
                    Button("Done") {
                        field = nil
                    }
                }
            }
    }
    
    func openInZoom() {
        if let url = url, let urlString = meeting.urlString, let zoomLink = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(zoomLink)
        }
    }
    
}
