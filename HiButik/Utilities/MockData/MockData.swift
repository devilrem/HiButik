//
//  MockData.swift
//  HiButik
//
//  Created by Remi Yesil on 4.08.2025.
//

import Foundation

struct MockData {
    static let urun: [Urun] = [
        .init(
            id: NSUUID().uuidString,
            isim: "kırmızı elbise",
            marka: "zara",
            fiyat: 1000,
            profileImageURLs: ["e11", "e12", "e13"]
        ),
        .init(
            id: NSUUID().uuidString,
            isim: "gri elbise",
            marka: "zara",
            fiyat: 1600,
            profileImageURLs: ["e21", "e22", "e23"]
        ),
        .init(
            id: NSUUID().uuidString,
            isim: "kahve elbise",
            marka: "zara",
            fiyat: 990,
            profileImageURLs: ["e31", "e32", "e33","e34","e35"]
        ),
        .init(
            id: NSUUID().uuidString,
            isim: "beyaz elbise",
            marka: "zara",
            fiyat: 2400,
            profileImageURLs: ["e41", "e42", "e43","e44"]
        )
    ]

}
