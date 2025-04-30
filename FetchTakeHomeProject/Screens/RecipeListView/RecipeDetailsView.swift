//
//  RecipeDetailsView.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/14/25.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @EnvironmentObject var favorite: Favorite
    
    
    let recipe: Recipe
    @Binding var isShowingDetailView: Bool
    
    
    
    var body: some View {
        
        VStack(spacing: 10) {
                RecipeRemoteImage(urlString: recipe.photo_url_large!)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 330)
                
//                AsyncImage(url: URL(string: recipe.photo_url_large!)) { image in
//                    image
//
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 400, height: 330)
//                } placeholder: {
//                    Image("foodImagePlaceholder")
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 400, height: 330)
//                }

                    
                VStack {
                    Text(recipe.name ?? "No name :(")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text(recipe.cuisine!)
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
            let urlVideoString = recipe.youtube_url
            if let videoIDEmbed = urlVideoString?.components(separatedBy: "v=").last {
                VideoView(videoID: videoIDEmbed)
                    //.aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 180)
            }
            
                
            
                Spacer()

                Button {
                    favorite.add(recipe)
                    isShowingDetailView = false
                } label: {
                   //RecipeButton(title: "Add to Favorites")
                    Text("Add to Favorites")
                }
                .buttonStyle(.bordered)
                .tint(.accentColor)
                .controlSize(.large)
                .padding(.bottom, 30)
                
            }
            .frame(width: 325, height: 675)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetailView = false
            } label: {
                DismissButton()
            }, alignment: .topTrailing)
            
            
            
        
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipe: MockData.sampleRecipe, isShowingDetailView: .constant(true))
    }
}
