//
//  MusteriProfilHeaderView.swift
//  HiButik
//
//  Created by Remi Yesil on 8.08.2025.
//

import SwiftUI

struct MusteriProfilHeaderView: View {
    let musteri: Musteri
    var body: some View {
        VStack{
            Text(musteri.isim)
                .fontWeight(.bold)
 
            Text(musteri.email)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MusteriProfilHeaderView(musteri: MockData.musteri[0])
}
