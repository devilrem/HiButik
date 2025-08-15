//
//  SizeConstants.swift
//  HiButik
//
//  Created by Remi Yesil on 1.08.2025.
//

import SwiftUI

struct SizeConstants {
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8 //farklı boy ekranlarda ortayı bulmak için
    }
         static var cardwidth: CGFloat { //diktorgenin genişliği ve uzunlugu
            UIScreen.main.bounds.width - 20
        }
        
         static var cardheight: CGFloat {
            UIScreen.main.bounds.height / 1.45
        }
}
