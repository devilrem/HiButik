//
//  CardsViewModel.swift
//  HiButik
//
//  Created by Remi Yesil on 4.08.2025.
//

import Foundation

@MainActor

class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    private let service: CardService
    init(service: CardService){
        self.service = service
        Task {await fetchCardModels()}
    }
    func fetchCardModels() async {
        do{
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("failed to fetch cards \(error)")
        }
    }
    func removeCard(_ card: CardModel) {     //hangi kartın silineceğini loop yaparak bulur ve siler.
        guard let index = cardModels.firstIndex(where: {$0.id == card.id}) else {return}
        cardModels.remove(at: index)
    }
}
