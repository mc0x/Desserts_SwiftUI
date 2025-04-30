//
//  NetworkManager.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/10/25.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    
    private init() {}
    
    func getRecipes() async throws -> [Recipe]{
        guard let url = URL(string: baseURL) else {
            throw RecipeError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do{
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(RecipeResponse.self, from: data)
            return decodedResponse.recipes
        } catch {
            throw RecipeError.invalidData
        }
    }

    func downloadImage(fromURLString urlString: String) async -> UIImage? {
        let cacheKey = NSString(string: urlString)
        
        //check the cache to see if image has previously been downloaded in cache
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        //check the url
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //create image
            if let image = UIImage(data: data) {
                //set item in cache
                cache.setObject(image, forKey: cacheKey)
                return image
            }
        } catch {
            return nil
        }
        return nil
    }
    

}
