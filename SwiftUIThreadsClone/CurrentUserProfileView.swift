//
//  CurrentUserProfileView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 21/08/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false, content: {
                
                VStack(spacing: 20) {
                    
                    ProfileHeaderView(user: currentUser)
                    
                    
                    
                    Button(action: {
                        showEditProfile.toggle()
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352,  height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke( Color(.systemGray4), lineWidth: 1)
                            }
                    })
                    
                    UserContentListView(user: DeveloperPreview.shared.user)
                }
                
            })
            .sheet(isPresented: $showEditProfile, content: {
                if currentUser != nil {
                    EditProfileView(user: DeveloperPreview.shared.user)
                }
                
                    
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
