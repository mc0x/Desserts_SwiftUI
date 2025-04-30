//
//  RecipeListCell.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/10/25.
//

import SwiftUI

struct RecipeListCell: View {
    let recipe: Recipe
    var body: some View {
        HStack{
            RecipeRemoteImage(urlString: recipe.photo_url_small!)
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
//            AsyncImage(url: URL(string: recipe.photo_url_small!)) { image in
//                image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 90)
//                    .cornerRadius(8)
//            } placeholder: {
//                Image("foodImagePlaceholder")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 90)
//                    .cornerRadius(8)
//            }

            
            VStack(alignment: .leading, spacing: 1) {
                Text(recipe.name ?? "🧁")
                    .font(.title2)
                    .fontWeight(.medium)
                Text(recipe.cuisine ?? "")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                
            }
        }
    }
}

struct RecipeListCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListCell(recipe: MockData.sampleRecipe)
    }
}
