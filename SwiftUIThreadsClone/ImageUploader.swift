//
//  ImageUploader.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 21/08/2023.
//

import Foundation
import Firebase
import FirebaseStorage

class ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else {return nil}
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: failed to download image")
            return nil
        }
    }
}

