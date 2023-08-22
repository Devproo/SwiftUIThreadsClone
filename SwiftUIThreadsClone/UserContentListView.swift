//
//  UserContentListView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 21/08/2023.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
   @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
}
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: DeveloperPreview.shared.user))
    }
    
//    private var currentUser: User? {
//        return viewModel.currentUser
//    }
    var body: some View {
        VStack(content: {
            HStack(content: {
                ForEach(ProfileThreadFilter.allCases) { filter in
                    VStack(content: {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold :.regular)
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    })
                    .onTapGesture(perform: {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    })
                    
                }
            })
            LazyVStack(content: {
                ForEach(viewModel.threads) { count in
                    ThreadCell(thread: DeveloperPreview.shared.thread)
                }
            })
        })
        .padding(.vertical, 8)
        
    }
}

#Preview {
    UserContentListView(user: DeveloperPreview.shared.user)
}
