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
        NavigationStack {
            VStack(spacing: 16) {
                ZStack {
                    ForEach(viewModel.cardModels) { card in
                        CardView(viewModel: viewModel, model: card)
                    }
                }
                if !viewModel.cardModels.isEmpty {
                    // SwipeActionButtonView(viewModel: viewModel)
                    //alttaki like reject düğmelerini gösterir
                    
                }
            }
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Image("logo1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 40) // Set your desired logo size
                        .clipped()
                }
            }
        }
    }
}

#Preview {
    CardStackView()
}
