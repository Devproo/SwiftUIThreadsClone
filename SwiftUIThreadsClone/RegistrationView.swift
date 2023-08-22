//
//  RegistrationView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 19/08/2023.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
  
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("Threads-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            VStack {
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your full  name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Enter your usename", text: $viewModel.username)
                    .autocapitalization(.none)
                    .modifier(ThreadsTextFieldModifier())
                    
            }
            Button {
                
            } label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
                
            }
            .padding(.vertical)
            Spacer()
            Divider()
            
            Button {
                Task {
                    try await viewModel.createUser()
                }
            } label: {
                HStack(spacing:  3) {
                    Text("Already have an account")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                       
                }
                .padding(.vertical, 16)
                .foregroundColor(.black)
            }

            
        }
        
    }
}

#Preview {
    RegistrationView()
}
