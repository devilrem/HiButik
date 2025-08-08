//
//  CardStackView.swift
//  HiButik
//
//  Created by Remi Yesil on 4.08.2025.
//

import SwiftUI


struct CardStackView: View {
    
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        ZStack {
            ForEach(viewModel.cardModels) { card in
                CardView(viewModel: viewModel, model: card)
            }
        }
    }
}

#Preview {
    CardStackView()
}
