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
        var secret: Secrets?
        init(secret: String) {
                self.secret = Secrets(rawValue: secret)
        }
        static let apiValue = Secrets.apiKey.rawValue
        
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiValue)")
    }
    
    private init() {}
    
    
    func getTopStories (completion: @escaping (Result<[Article], Error>) -> Void){
        guard let url =  Constants.topHeadlinesURL else{
            return
        }
        

        print("ham: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponce.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                    
                } catch {
                    print("didnt work")
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
    
    let  source: Source
    let title: String
    let description:  String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    
}

struct Source: Codable {
    let name: String
}
