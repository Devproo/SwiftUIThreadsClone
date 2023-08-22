//
//  ThreadsTabView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 19/08/2023.
//

import SwiftUI

struct ThreadsTabView: View {
    let user: User
    @State private var selectedTab = 0
    @State private var showCreateThreadsView = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house" )
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear {selectedTab = 0}
                .tag(0)
            
            ExplorerView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear {selectedTab = 1}
                .tag(1)
            
      Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear { selectedTab = 2}
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear {selectedTab = 3}
                .tag(3)
            
            ProfileView(user: user )
                .tabItem {
                    Image(systemName: selectedTab == 4  ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear {selectedTab = 4}
                .tag(4)
        }
        .onChange(of: selectedTab, perform: { newValue in
            showCreateThreadsView = selectedTab == 2
        })
        .sheet(isPresented: $showCreateThreadsView, onDismiss: {selectedTab = 4}, content: {
            CreateThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView(user: DeveloperPreview.shared.user)
}
