//
//  ContentView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 16/08/2023.
//

import SwiftUI

struct ContentView: View {
    let user: User
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        if viewModel.userSession != nil {
            ThreadsTabView(user: user)
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView(user: DeveloperPreview.shared.user)
}
