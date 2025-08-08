//
//  SwipeActionIndicator.swift
//  HiButik
//
//  Created by Remi Yesil on 28.07.2025.
//

import SwiftUI

/// Kaydırma yönüne göre “LIKE” / “NOPE” ibarelerini
/// şeffaf biçimde gösteren yardımcı view.
///
/// - Parameters:
///   - xOffset: Kartın mevcut X ekseni kaydırması (binding).
///              Kart sağa/sola gittikçe alfa değerleri artar.
///   - cutoff:  Ekrandan “tamamlanmış” sayılacak kaydırma eşiği.
///              Genellikle `SizeConstants.screenCutoff`.
struct SwipeActionIndicatorView: View {
    @Binding var xOffset: CGFloat
    
    var body: some View {
        HStack {
            // LIKE (sol üst)
            Text(Image(systemName: "cart"))
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay{
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .frame(width: 50, height: 48)
                        .shadow(radius: 6)
                }
                .opacity(Double(xOffset / SizeConstants.screenCutoff))
            
            Spacer()
            // NOPE (sağ üst)
    
            Text(Image(systemName: "xmark"))
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.black)
                .overlay{
                    Circle()
                        .stroke(.black, lineWidth: 3)
                        .frame(width: 50, height: 48)
                        .shadow(radius: 6)
                }
                .opacity(Double(xOffset / SizeConstants.screenCutoff) * -1)
        }
        .padding(40)
    }
}
    
    
    
#Preview {
    SwipeActionIndicatorView(xOffset: .constant(100))
}

