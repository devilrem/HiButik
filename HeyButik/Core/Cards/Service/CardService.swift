//
//  CardService.swift
//  HiButik
//
//  Created by Remi Yesil on 4.08.2025.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let urun = MockData.urun
        return urun.map({ CardModel(urun: $0) })
    }
    
}
