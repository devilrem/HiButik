//
//  MusteriProfilView.swift
//  HiButik
//
//  Created by Remi Yesil on 8.08.2025.
//

import SwiftUI

struct MusteriProfilView: View {
    let musteri: Musteri
    
    var body: some View {
        NavigationStack{
            List{
                //header
                Section("Hesap Bilgileri") {
                    MusteriProfilHeaderView(musteri: musteri)//burada bir yanlışlık olabilir
                }
                        //account info
                Section("Yardım") {
                    Text("Kullanıcı Sözleşmesi")
                    Text("SSS")
                }
                
                //çıkış
                Section() {
                    Button("Çıkış Yap") {
                        print("Çıkış yapıldı")
                    }
                }
            }
        }
    }
}

#Preview {
    MusteriProfilView(musteri: MockData.musteri[1])
}
