//
//  ProfileThreadFilter.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 20/08/2023.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies

    
    var title: String {
        switch self {
        case .threads:
            return "threads"
        case .replies:
            return "replies"
       
        }
    }
    var id: Int {
        return self.rawValue
    }
}
