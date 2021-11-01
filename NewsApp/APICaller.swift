//
//  APICaller.swift
//  NewsApp
//
//  Created by Nicholas Siciliano-Salazar  on 10/31/21.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=API_KEY")
    }
    
    private init() {}
}
