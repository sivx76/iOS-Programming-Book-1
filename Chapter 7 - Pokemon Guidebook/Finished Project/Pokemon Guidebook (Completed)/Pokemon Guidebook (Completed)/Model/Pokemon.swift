//
//  Pokemon.swift
//  Pokemon Guidebook
//
//  Created by Ben Alemu on 6/22/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    let name: String
    let url: String
}

struct PokemonList: Codable {
    
    let results: [Pokemon]
}

struct PokemonData: Codable {
    let id: Int
    let types: [PokemonTypeEntry]
}

struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Codable {
    let name: String
    let url: String
}


