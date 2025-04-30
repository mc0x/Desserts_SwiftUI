//
//  Alert.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/13/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("Data Invalid"), dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"), message: Text("Errorrrr"), dismissButton: .default(Text("Ok")))
    
    static let invalidURL = AlertItem(title: Text("Invalid URL"), message: Text("Error"), dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Unable To Complete"), message: Text("Errorrrr"), dismissButton: .default(Text("Ok")))
    
//    static let alreadyAdded = AlertItem(title: Text("Recipe already added to favorites!"), message: Text(""), dismissButton: .default(Text("Ok")))
}
