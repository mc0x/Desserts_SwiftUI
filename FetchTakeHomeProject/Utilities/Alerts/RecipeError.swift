//
//  RecipeError.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/10/25.
//

import Foundation

enum RecipeError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
