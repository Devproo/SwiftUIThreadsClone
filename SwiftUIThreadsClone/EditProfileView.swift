//
//  EditProfileView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 20/08/2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(content: {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                VStack(content: {
                    HStack(content: {
                        VStack(alignment:.leading, content: {
                            
                            Text("name")
                                .fontWeight(.semibold)
                            Text(user.fullname)
                            
                           
                        })
                      
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                      
                    })
                    
                    Divider()
                    VStack(alignment:. leading,content: {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio", text: $bio, axis: .vertical)
                    })
                  
                    
                    Divider()
                    
                    VStack(alignment:. leading,content: {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link ", text: $link, axis: .vertical)
                    })
                   
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                    
                })
                .padding()
                .background(.white)
                .padding()
                .cornerRadius(10)
                .overlay( content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                })
                .font(.footnote)
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                           dismiss()
                        }
                        .font(.subheadline)
                        .foregroundColor(.black)
                        
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            Task { try await viewModel.updateUserData()
                                dismiss()
                            }
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    }
                })
            })
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.shared.user)
}
