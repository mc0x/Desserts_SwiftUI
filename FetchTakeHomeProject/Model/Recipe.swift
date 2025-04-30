//
//  Recipe.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/10/25.
//

import Foundation

struct Recipe: Codable {
    let cuisine: String?
    let name: String?
    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    let uuid: String?
    let youtube_url: String?
}

struct RecipeResponse: Codable {
    let recipes: [Recipe]
}

struct MockData {
    static let sampleRecipe = Recipe(cuisine: "Italian", name: "Pizza", photo_url_large: "photo url", photo_url_small: "small url photo", source_url: "source url", uuid: "uuid", youtube_url: "youtube url")
    
    static let recipes = [sampleRecipe, sampleRecipe, sampleRecipe]
    
    
    static let favItemOne = Recipe(cuisine: "Italian", name: "Pizza", photo_url_large: "photo url", photo_url_small: "small url photo", source_url: "source url", uuid: "uuid1", youtube_url: "youtube url")
    
    static let favItemTwo = Recipe(cuisine: "Italian", name: "Salad", photo_url_large: "photo url", photo_url_small: "small url photo", source_url: "source url", uuid: "uuid2", youtube_url: "youtube url")
    
    static let favItemThree = Recipe(cuisine: "Italian", name: "Sushi", photo_url_large: "photo url", photo_url_small: "small url photo", source_url: "source url", uuid: "uuid3", youtube_url: "youtube url")
    
    static let favItems = [favItemOne, favItemTwo, favItemThree]
}

