//
//  FetchTakeHomeProjectApp.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/8/25.
//

import SwiftUI

@main
struct DessertsSwiftUIProject: App {
    
    var favorite = Favorite()
    
    var body: some Scene {
        WindowGroup {
            RecipeTabView().environmentObject(favorite)
        }
    }
    
}
