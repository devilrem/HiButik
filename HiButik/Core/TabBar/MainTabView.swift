//
//  MainTabView.swift
//  HiButik
//
//  Created by Remi Yesil on 25.07.2025.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
            HStack {
                Image("logo1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 40) // Set your desired logo size
                    .clipped()
            }
        
        TabView {
            CardStackView()
                .tabItem { Image(systemName: "person.2.square.stack")}
                .tag(0)
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass")}
                .tag(1)
            Text("Favorites")
                .tabItem { Image(systemName: "heart")}
                .tag(2)
            Text("Profile")
                .tabItem { Image(systemName: "person")}
                .tag(3)
        }
        .tint(.red) //dugmeleri siyah yapar
    }
}

#Preview {
    MainTabView()
}
