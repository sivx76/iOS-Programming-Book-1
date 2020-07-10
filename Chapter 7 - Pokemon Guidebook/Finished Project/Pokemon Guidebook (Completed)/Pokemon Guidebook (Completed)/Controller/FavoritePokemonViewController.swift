//
//  FavoritePokemonViewController.swift
//  Pokemon Guidebook
//
//  Created by Ben Alemu on 6/22/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import Foundation
import UIKit

class FavoritePokemonViewController: UITableViewController {
    
    //no need to define an outlet for the tableview
    let defaults = UserDefaults.standard

    
    var allPokemon = [Pokemon]()
    var savedPokemon = [Pokemon]()
    
    var priorIndex: [Int] = [0]
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        fetchSavedPokemon(number: 151)

    }
    
    @IBAction func deleteFavorites(_ sender: Any) {
        
        savedPokemon = [Pokemon]()
        priorIndex = [0]
        tableView.reloadData()
    
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return savedPokemon.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedPokemonCell", for: indexPath)
                
        cell.textLabel?.text = savedPokemon[indexPath.row].name.capitalized
        
        return cell
    }
    
    
    func fetchSavedPokemon(number: Int) {
        
        let baseURL = "https://pokeapi.co/api/v2/pokemon"
        let constructedURL = baseURL + "?limit=\(number)"
        let requestURL = URL(string: constructedURL)
        
        guard let url = requestURL else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            
            do {
                let fetchedPokemon = try JSONDecoder().decode(PokemonList.self, from: data)
                
                self.allPokemon = fetchedPokemon.results
                
                
                //processing
                let savedPokemonIndex : [Int] = self.defaults.array(forKey: "savedPokemonIndex") as! [Int]
                        
                if savedPokemonIndex != self.priorIndex {
                    
                    for i in savedPokemonIndex {
                      self.savedPokemon.append(self.allPokemon[i])
                        
                    }
                    
                    self.priorIndex = savedPokemonIndex

                    
                }
                      
                             
             DispatchQueue.main.async {
                self.tableView.reloadData()
                 }
             
            }
            
            catch let error {
                print("\(error)")
            }
        }.resume()
        
        
    }
    
    
    
}
