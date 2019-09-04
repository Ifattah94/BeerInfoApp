//
//  BeerAPIManager.swift
//  BeerInfoApp
//
//  Created by C4Q on 9/4/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation

class BeerAPIManager {
    private init () {}
    
    static let shared = BeerAPIManager()
    
    
    func getBeer(completionHandler: @escaping (Result<[Beer], Error>) -> Void){
        
        let urlStr = "https://api.punkapi.com/v2/beers?page=1&per_page=40"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(.failure(ErrorHandling.badURL))
            return
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            
            do {
            let beerData = try JSONDecoder().decode([Beer].self, from: data)
                completionHandler(.success(beerData))
            }
            catch {
                completionHandler(.failure(ErrorHandling.decodingError))
            }
            
            
            
        }.resume()
        
        
    }
    
    
}
