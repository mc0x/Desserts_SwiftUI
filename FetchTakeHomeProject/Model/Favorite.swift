//
//  Favorites.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/15/25.
//

import SwiftUI


final class Favorite: ObservableObject {
    @Published var items: [Recipe] = []

    
    func add(_ recipe: Recipe) {
        if !items.contains(where: { $0.uuid == recipe.uuid}) {
            items.append(recipe)
        }
        
    }
    
  
}

