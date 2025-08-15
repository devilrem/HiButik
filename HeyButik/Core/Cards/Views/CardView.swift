//
//  CardView.swift
//  HiButik
//
//  Created by Remi Yesil on 25.07.2025.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModal = false

    
    let model: CardModel
    
    var body: some View {
        ZStack (alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(urun.profileImageURLs[currentImageIndex]) //ürünlerin resmi
                    .resizable()
                    .overlay{
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            
            UserInfoView(showProfileModal: $showProfileModal, urun: urun) //resmin içindeki yazıları gösterir
        }
        .fullScreenCover(isPresented: $showProfileModal) {
            UrunIcerikView(urun: urun)
                }
        .onReceive(viewModel.$buttonSwipeAction, perform: {action in
            onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardwidth, height: SizeConstants.cardheight)
        .clipShape(RoundedRectangle(cornerRadius: 10)) //dikdortgenin koşeleri yuvarlaklaştırır
        .offset(x: xOffset) //saga sola kaymayı ayarlar
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)

        )
    }
}

private extension CardView {
    var urun: Urun {
        return model.urun
    }
    var imageCount: Int {
        return model.urun.profileImageURLs.count
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    func swipeRight() {
        withAnimation{
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func swipeLeft() {
        withAnimation{
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    func onReceiveSwipeAction(_ action:SwipeAction?) {
        guard let action else { return }
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value){
        xOffset = value.translation.width //fotoyu saga sola iter
        degrees = Double(value.translation.width / 25) //fotonun açısını değiştirir
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}


#Preview {
    CardView(
        viewModel: CardsViewModel(service: CardService()),
        model: CardModel(urun: MockData.urun[1])
    )
}
