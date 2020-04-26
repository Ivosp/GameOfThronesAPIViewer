//
//  CharacterModel.swift
//  GotAPIDifferent
//
//  Created by Ivo Specht on 25/04/2020.
//  Copyright © 2020 Ivo Specht. All rights reserved.
//

import Foundation


struct CharacterModel: Decodable {
    
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let titles: [String]
    let aliases: [String]
    let father: String
    let mother: String
    let spouse: String
    let allegiances: [String]
    let books: [String]
    let povBooks: [String]
    let tvSeries: [String]
    let playedBy: [String]
    
}
