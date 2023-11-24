//
//  ZoomMeeting.swift
//  MeetingLink
//
//  Created by Cameron Grigoriadis on 11/20/23.
//

import Foundation
import SwiftData
import CoreTransferable

@Model
final class ZoomMeeting: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case id, name, baseURL
    }
    
    let id = UUID()
    var name: String
    var baseURL: URL
    let zoomAppURL = URL(string: "zoomus://")!
    
    var url: URL {
        URL(string: zoomAppURL.absoluteString + baseURL.absoluteString)!
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        baseURL = try container.decode(URL.self, forKey: .baseURL)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(baseURL, forKey: .baseURL)
    }
    
    init(name: String, baseURL: URL) {
        self.name = name
        self.baseURL = baseURL
    }
}

extension ZoomMeeting: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(for: ZoomMeeting.self, contentType: .zoomMeeting)
    }
}

import UniformTypeIdentifiers

extension UTType {
    static var zoomMeeting: UTType = UTType(exportedAs: "com.camgrigo.zmtg")
}
