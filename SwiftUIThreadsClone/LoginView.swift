//
//  LoginView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 16/08/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
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
                    
                }
                NavigationLink {
                    Text("forgot password")
                } label: {
                    Text("forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 20)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Button {
                    Task {
                        try await viewModel.login()
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                    
                }
                
                Spacer()
                Divider()
                
                NavigationLink {
                   RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:  3) {
                        Text("Don't have an account")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                   
                    .foregroundColor(.black)
                    .font(.footnote)
                    
                }
                .padding(.vertical, 16)

                
                
            }
            
        }
    }
}

#Preview {
    LoginView()
}
