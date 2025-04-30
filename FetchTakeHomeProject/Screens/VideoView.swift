//
//  VideoView.swift
//  FetchTakeHomeProject
//
//  Created by Mayra Cortez on 2/4/25.
//

import SwiftUI
import WebKit


struct VideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        
        uiView.scrollView.isScrollEnabled = true
        
        uiView.load(URLRequest(url: youtubeURL))
        
        
    }
    
}
