//
//  LoginViewModel.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 20/08/2023.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published  var email = ""
    @Published  var password = ""
    
    
    @MainActor
    func login() async throws  {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
