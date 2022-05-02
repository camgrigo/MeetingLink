//
//  CallButton.swift
//  Meetings
//
//  Created by Cameron Grigoriadis on 5/1/22.
//

import SwiftUI

struct CallButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle().stroke(lineWidth: 2)
                    .shadow(color: .accentColor, radius: 10)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.white, Color(hue: 196 / 360, saturation: 0 / 100, brightness: 88 / 100)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .mask(Image(systemName: "phone")
                                .symbolVariant(.fill)
                                .font(.system(size: 100)))
                            .shadow(radius: 5)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                .background(Circle().fill(LinearGradient(gradient: Gradient(colors: [.blue, Color(hue: 231 / 360, saturation: 90 / 100, brightness: 80 / 100)]), startPoint: .top, endPoint: .bottom)).aspectRatio(1, contentMode: .fit))
                .padding()
            }
        }
        .frame(maxWidth: 300)
    }
    
}
