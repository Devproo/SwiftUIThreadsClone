//
//  ProfileViewModel.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 20/08/2023.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupScribers()
    }
    private func setupScribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            
            
        }.store(in: &cancellables)
    }
   
}
