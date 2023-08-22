//
//  UserCell.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 20/08/2023.
//

import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .small )
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    
                    .fontWeight(.semibold)
                Text(user.fullname)
                 
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke( Color(.systemGray4), lineWidth: 1)
                }

        }
     
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.shared.user)
}
