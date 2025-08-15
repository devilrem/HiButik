//
//  CardImageIndicatorView.swift
//  HiButik
//
//  Created by Remi Yesil on 4.08.2025.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack{
            ForEach(0 ..< imageCount, id:\.self) { index in
                Capsule()
                    .foregroundStyle(currentImageIndex == index ? .red : .gray)
                    .frame(width: ImageIndicatorWidth, height: 4)
                    .padding(.top, 8)
            }
        }
    }
}

private extension CardImageIndicatorView {
    var ImageIndicatorWidth: CGFloat {
        return SizeConstants.cardwidth / CGFloat(imageCount) - 28
    }
}
#Preview {
    CardImageIndicatorView(currentImageIndex: 1, imageCount: 3)
}
