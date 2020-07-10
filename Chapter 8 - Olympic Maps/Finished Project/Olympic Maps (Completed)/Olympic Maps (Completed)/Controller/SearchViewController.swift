//
//  ViewController.swift
//  Olympic Maps (Completed)
//
//  Created by Ben Alemu on 6/25/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import UIKit


class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    let allSeries = OlympicSeries()
    var searchedSeries = [String]()
    var searching = false
    
    var hostNations = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.delegate = self
        tableview.dataSource = self
        searchBar.delegate = self
        
        
        for i in 0..<allSeries.gamesSince2000.count {
            let nation = allSeries.gamesSince2000[i].hostNation
            
            hostNations.append(nation)
        }
    }
    

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            return searchedSeries.count
        } else {
            return allSeries.gamesSince2000.count

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OlympicsCell", for: indexPath)
        
        if searching {
            cell.textLabel?.text = searchedSeries[indexPath.row]
        } else {
            cell.textLabel?.text = "\(allSeries.gamesSince2000[indexPath.row].hostNation)"

        }
        
        return cell
    }
    
       
   }


extension SearchViewController: UISearchBarDelegate {
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          
        searchedSeries = hostNations.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
          
          searching = true
          
          tableview.reloadData()
      }
      
      func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
          
          searching = false
          searchBar.text = ""
          tableview.reloadData()
        
      }
    
}

