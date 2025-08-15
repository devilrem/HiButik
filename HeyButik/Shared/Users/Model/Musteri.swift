//
//  Musteri.swift
//  HiButik
//
//  Created by Remi Yesil on 8.08.2025.
//

import Foundation

struct Musteri: Identifiable, Hashable {
    let id: String
    let isim: String
    let email: String
    //var fiyat: Int
    //var profileImageURL: String
    //let website: String
    
    /// Müşterinin beğendiği ürünlerin ID listesi
    var liked: [String]
    
    /// Müşterinin beğenmediği ürünlerin ID listesi
    var disliked: [String]
}
