//
//  CharacterRequest.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 25/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import Foundation

// https://www.anapioficeandfire.com/api/characters?page=1&pageSize=50

enum CharacterError: Error {
    case connectionIssue
    case decodingIssue
}

struct CharacterRequest {
    
    let resourceURL: URL
    
    init(page: Int) {
        let resourceString = "https://www.anapioficeandfire.com/api/characters?page=\(page)&pageSize=50"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
    }
    
    func fetchCharacterData(completion: @escaping(Result<[CharacterModel], CharacterError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, _) in
            
            if let response = response as? HTTPURLResponse {
                let links = response.value(forHTTPHeaderField: "link")
            }
            
            guard let jsonData = data else {
                completion(.failure(.decodingIssue))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characterResponse = try decoder.decode([CharacterModel].self, from: jsonData)
                
                print("\(characterResponse) in FetchCharData")
                completion(.success(characterResponse))
            } catch {
                completion(.failure(.connectionIssue))
            }
            
            
        }.resume()
        
    }
    
    
}
