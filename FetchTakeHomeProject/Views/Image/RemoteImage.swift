//
//  RemoteImage.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 1/13/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil

    func load(fromURLString urlString: String) async {
        if let uiImage = await NetworkManager.shared.downloadImage(fromURLString: urlString) {
            await MainActor.run {
                self.image = Image(uiImage: uiImage)
            }
        }

        
        
        
        
//        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
//            guard let uiImage = uiImage else { return }
//            DispatchQueue.main.async {
//                self.image = Image(uiImage: uiImage)
//            }
//        }
    }
}

//helper
struct RemoteImage: View {
    var image: Image?

    var body: some View {
        image?.resizable() ?? Image("foodImagePlaceholder").resizable()
    }
}


struct RecipeRemoteImage: View  {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .task {
                await imageLoader.load(fromURLString: urlString)
            }
            
    }
}
