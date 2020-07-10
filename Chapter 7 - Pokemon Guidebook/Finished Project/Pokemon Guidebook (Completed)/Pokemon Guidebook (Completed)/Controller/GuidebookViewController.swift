//
//  GuidebookViewController.swift
//  Pokemon Guidebook
//
//  Created by Ben Alemu on 6/22/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import Foundation
import UIKit

class GuidebookViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var type1Label: UILabel!
    @IBOutlet weak var type2Label: UILabel!
    
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    
    var pokemon: Pokemon!
    var pokemonID: Int = 0
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemon()
        
    }
    
    
    @IBAction func favoritePokemon(_ sender: Any) {
    
    //Save with User Defaults
    defaults.set([pokemonID - 1], forKey: "savedPokemonIndex")
    }
    
    
    
    
    
    // MARK: - Networking
     func fetchPokemon() {
        
        let requestURL = URL(string: pokemon.url)
        
        guard let url = requestURL else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            
            do {
                let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                
             
             DispatchQueue.main.async {
                
                
                self.nameLabel.text = self.pokemon.name.capitalized
                self.numberLabel.text = String(format: "#%03d", pokemonData.id)
                
                self.pokemonID = pokemonData.id
                
                for typeEntry in pokemonData.types {
                    if typeEntry.slot == 1 {
                        self.type1Label.text = typeEntry.type.name.capitalized
                        }
                    
                    else if typeEntry.slot == 2 {
                        self.type2Label.text = typeEntry.type.name.capitalized
                        }
                        
                    }

                }
                 
            }
            
            catch let error {
                print("\(error)")
            }
            
        }.resume()
        
        
    }
    
}
