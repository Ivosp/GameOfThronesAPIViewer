//
//  BookModel.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 25/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import Foundation

struct BookModel: Decodable {
    
    var name: String
    var isbn: String
    var authors: [String]
    var numberOfPages: Int
    var publisher: String
    var country: String
    var mediaType: String
    var released: String
    var characters: [String]
    var povCharacters: [String]
    
}
