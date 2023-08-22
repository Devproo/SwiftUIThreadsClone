//
//  CreateThreadViewModel.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 22/08/2023.
//

import Firebase
import FirebaseAuth
class CreateThreadViewModel : ObservableObject {
//    @Published private var caption = ""
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let thread = Thread( ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
        
    }
}
