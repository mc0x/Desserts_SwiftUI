//
//  RecipeButton.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/15/25.
//

import SwiftUI

struct RecipeButton: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(10)
    }
}

struct RecipeButton_Previews: PreviewProvider {
    static var previews: some View {
        RecipeButton(title: "Test")
    }
}
