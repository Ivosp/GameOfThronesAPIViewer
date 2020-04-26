//
//  BookRequest.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 25/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import Foundation

// https://www.anapioficeandfire.com/api/books?page=1&pageSize=40 gives back all books, as there are only 12 books in total


enum BookErrors: Error {
    case connectionError
    case parsingError
}

struct BookRequest {
    
    
    let resourceURL: URL
    
    init() {
        let resourceString = "https://www.anapioficeandfire.com/api/books?page=1&pageSize=40"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
        
        
    }
    
    
    func fetchBookData(completion: @escaping(Result<[BookModel], BookErrors>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, _) in
            
            if let HTTPResponse = response {
                print(HTTPResponse)
            }
            
            guard let jsonData = data else {
                completion(.failure(BookErrors.connectionError))
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let booksResponse = try decoder.decode([BookModel].self, from: jsonData)
                
                completion(.success(booksResponse))
            } catch {
                completion(.failure(.parsingError))
            }
        }.resume()
        
        
    }
    
    
}
