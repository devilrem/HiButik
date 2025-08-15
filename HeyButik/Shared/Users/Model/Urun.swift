//
//  User.swift
//  HiButik
//
//  Created by Remi Yesil on 4.08.2025.
//

import Foundation

struct Urun: Identifiable, Hashable {
    let id: String
    let isim: String
    let marka: String
    var fiyat: Int
    var profileImageURLs: [String]
    let website: String
}
