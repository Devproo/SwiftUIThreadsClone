//
//  Thread.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 22/08/2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerUid: String
    let caption: String
   let timestamp: Timestamp 
    var likes: Int
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
    
    var user: User?
}
