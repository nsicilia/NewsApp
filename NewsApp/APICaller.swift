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
    
    public func getTopStories(completion: @escaping (Result<[String],Error>) -> Void){
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, , error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data{
                do{
                    let result = try JSONDecoder().decode(String.self, from: data)
                }
                catch{
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
        
    }
}

//Models

struct APIResponce: Codable {
    let articles: [Article]
    
}

struct Article: Codable{
    
    let title: String
    let description:  String
    let url: String
    let urlToImage: String
    let publishedAt: String
    
}
