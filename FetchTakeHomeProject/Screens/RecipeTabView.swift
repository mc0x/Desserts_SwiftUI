//
//  ContentView.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/8/25.
//

import SwiftUI

struct RecipeTabView: View {
    @EnvironmentObject var favorite: Favorite

    
    init() {
            UITabBar.appearance().backgroundColor = UIColor.systemGray5
        }
    var body: some View {
        TabView {
            RecipeListView()
                .tabItem { Label("Home", systemImage: "house") }

            SavedView()
                .tabItem { Label("Favorites", systemImage: "heart") }
                .badge(favorite.items.count)
        }
        
        
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
