//
//  DismissButton.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/15/25.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.medium)
                .frame(width: 44, height: 44)
                .foregroundColor(.gray)
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
