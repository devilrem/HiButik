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
            profileImageURLs: ["e11", "e12", "e13"],
            website: "https://www.zara.com/tr/tr/dusuk-kollu--omzu-acikta-birakan-mini-elbise-p08634303.html?v1=468912868&v2=2420896"
        ),
        .init(
            id: NSUUID().uuidString,
            isim: "gri elbise",
            marka: "zara",
            fiyat: 1600,
            profileImageURLs: ["e21", "e22", "e23"],
            website: "https://www.zara.com/tr/tr/pullu-lingerie-stil-elbise-p01223454.html?v1=480181123&v2=2420896"
        ),
        .init(
            id: NSUUID().uuidString,
            isim: "kahve elbise",
            marka: "zara",
            fiyat: 990,
            profileImageURLs: ["e31", "e32", "e33","e34","e35"],
            website: "https://www.zara.com/tr/tr/keten-kisa-tulum-p03453722.html?v1=453508582&v2=2420896"
        ),
        .init(
            id: NSUUID().uuidString,
            isim: "beyaz elbise",
            marka: "zara",
            fiyat: 2400,
            profileImageURLs: ["e41", "e42", "e43","e44"],
            website: "https://www.zara.com/tr/tr/puskullu-pilili-triko-elbise-p04331026.html?v1=462627306&v2=2420896"
        )
    ]
    
    
    
    static let musteri: [Musteri] = [
        .init(
            id: NSUUID().uuidString,
            isim: "DtTT",
            email: "dttt@gmail.com",
            liked: [],
            disliked: []
        ),
        .init(
            id: NSUUID().uuidString,
            isim: "RRyy",
            email: "rryy@gmail.com",
            liked: [],
            disliked: []
        )
    ]
}
