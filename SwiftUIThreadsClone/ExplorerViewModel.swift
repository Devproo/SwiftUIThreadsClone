//
//  ExplorerViewModel.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 21/08/2023.
//

import Foundation

class ExplorerViewModel: ObservableObject {
    @Published var users = [User]()
    
    init () {
        Task { try await fetchUsers()}
    }
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
