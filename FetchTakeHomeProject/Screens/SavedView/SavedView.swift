//
//  OrderView.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/8/25.
//

import SwiftUI

struct SavedView: View {
    
    @EnvironmentObject var favorite: Favorite

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(favorite.items, id: \.uuid) { recipe in
                            RecipeListCell(recipe: recipe)
                        }
                        .onDelete(perform: { indexSet in
                            favorite.items.remove(atOffsets: indexSet)
                        })
                    }
                    .listStyle(InsetListStyle())
                }
                
                if favorite.items.isEmpty {
                    EmptyState(imageName: "empty", message: "No Recipes :(")
                }
            }
           .navigationTitle("Favorites")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        SavedView()
    }
}
