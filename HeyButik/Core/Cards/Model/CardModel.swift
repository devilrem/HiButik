//
//  CardModel.swift
//  HiButik
//
//  Created by Remi Yesil on 4.08.2025.
//

import Foundation

struct CardModel {
    let urun: Urun
    
}

extension CardModel: Identifiable, Hashable {
    var id: String { return urun.id}
}
