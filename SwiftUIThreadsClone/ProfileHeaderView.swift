//
//  ProfileHeaderView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 21/08/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var  user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                
                VStack(alignment: .leading, spacing: 4, content: {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "" )
                        .font(.subheadline)
                })
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shared.user)
}
