//
//  ProfileView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 19/08/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
   
var body: some View {
   
            ScrollView(showsIndicators: false, content: {
                
                VStack(spacing: 20) {
                    ProfileHeaderView(user: user)
                    
                    
                    Button(action: {}, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 352,  height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    })
                    UserContentListView(user: DeveloperPreview.shared.user)
                }
                
            })
            
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
        }
    }


#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
