//
//  ViewController.swift
//  Pokemon Guidebook
//
//  Created by Ben Alemu on 6/22/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
//    let pokemon: [Pokemon] = [
//        Pokemon(name: "Bulbasaur", number: 1),
//        Pokemon(name: "Ivysaur", number: 2),
//        Pokemon(name: "Venusaur", number: 3)
//    ]
    
    var allPokemon = [Pokemon]()
    
    let defaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchPokemon(number: 151)

        defaults.set([0], forKey: "savedPokemonIndex")
    }


    
    // MARK: - Tableview Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // Only want one section
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Want a row for each element of our data
        
        return allPokemon.count
     }
     
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // What data to display in each row | each row is backed by a cell | indexPath is the location of the cell in the table
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
                
        cell.textLabel?.text = allPokemon[indexPath.row].name.capitalized
        
        return cell
     }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
//        //What to do on each cell tap
//    }
    
    
     
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "openGuidebook" {
                
            if let destination = segue.destination as? GuidebookViewController {
                destination.pokemon = allPokemon[tableView.indexPathForSelectedRow!.row]
            
            }
            
        }
    }
    
    
       
       
       // MARK: - Networking
        func fetchPokemon(number: Int) {
           
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

