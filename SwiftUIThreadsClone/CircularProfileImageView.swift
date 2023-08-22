//
//  CircularProfileImageView.swift
//  SwiftUIThreadsClone
//
//  Created by ipeerless on 20/08/2023.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxsmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimention: CGFloat {
        switch self {
        case .xxsmall:
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 48
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
}





struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimention, height: size.dimention)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimention, height: size.dimention)
                .foregroundColor(Color(.systemGray4))
            
        }
    }
}

#Preview {
    CircularProfileImageView(user: DeveloperPreview.shared.user, size: .medium)
}
