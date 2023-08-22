//
//  CreateThreadView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 19/08/2023.
//

import SwiftUI

struct CreateThreadView: View {
    @StateObject var viewModel =  CreateThreadViewModel()
    @State private  var caption = ""
    @Environment(\.dismiss) var dismiss
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack(content: {
                HStack(alignment: .top, content: {
                    CircularProfileImageView(user: user, size: .small)
                    VStack(alignment: .leading,content: {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a thread...", text: $caption)
                    })
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty {
                        Button(action: {caption = ""}, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.black)
                        })
                    }
                    
                    
                    Spacer()
                })
                .padding()
                .navigationTitle("New Thread")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.subheadline)
                        .foregroundColor(.black)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Post") {
                            task {
                                do {
                                    try await viewModel.uploadThread(caption: caption)
                                    dismiss()
                                } catch {
                                    
                                    print("Error uploading thread:", error)
                                }
                            }
                        }
                        .disabled(caption.isEmpty)
                        .opacity(caption.isEmpty ? 0.5 : 1.0)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        
                    }
                }
            }
            )}
    }
    
}
#Preview {
    CreateThreadView()
}
