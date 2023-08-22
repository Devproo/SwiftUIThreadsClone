//
//  ThreadService.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 22/08/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadDate = try? Firestore.Encoder().encode(thread) else {return}
        try await Firestore.firestore().collection("threads").addDocument(data: threadDate)
        
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        
    }
    static func fetchUserThreads(uid: String) async throws ->[Thread] {
        let snapshot =  try await Firestore.firestore().collection("threads")
            .whereField("omitted", isEqualTo: uid).getDocuments()
        
        let threads =  snapshot.documents.compactMap({try? $0.data(as: Thread.self)})
        return threads.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
    
}
