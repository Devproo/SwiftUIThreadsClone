//
//  PreviewProvider.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 21/08/2023.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Adam Mohamed", email: "ipeer@yahoo.com", username: "Adam")
    let thread = Thread(ownerUid: "123", caption: "a thread", timestamp: Timestamp(), likes: 0)
    
}

