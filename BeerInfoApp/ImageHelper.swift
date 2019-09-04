//
//  ImageHelper.swift
//  BeerInfoApp
//
//  Created by C4Q on 9/4/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit
class ImageHelper {
    
    private init() {}
    
    static let shared = ImageHelper()
    
    
    func getImage(urlStr: String, completionHandler: @escaping (Result<UIImage, Error>) -> Void) {
        
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
            
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(ErrorHandling.noData))
                return
            }
            
            completionHandler(.success(image))
            
            
        }.resume()
    
        
        
    }
    
    
    
    
    
}
