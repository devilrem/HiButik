//
//  UserInfoView.swift
//  HiButik
//
//  Created by Remi Yesil on 25.07.2025.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var showProfileModal: Bool
    let urun: Urun
    
    var body: some View {
        VStack(alignment: .leading) {
            // Üst satır: İsim (sol üst)
            HStack {
                Text(urun.isim.uppercased())
                    .font(.headline)
                    .fontWeight(.heavy)
                Spacer()
                Button{
                    showProfileModal.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }

            // Alt satır: Marka (sol alt), Fiyat (sağ alt)
            HStack {
                Text(urun.marka.uppercased())
                Spacer()
                Text("\(urun.fiyat) TL")
            }
        }

        .foregroundStyle(.white)
        .padding()
        .background {
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        }
    }
}

#Preview {
    UserInfoView(showProfileModal: .constant(false), urun: MockData.urun[1])
}
