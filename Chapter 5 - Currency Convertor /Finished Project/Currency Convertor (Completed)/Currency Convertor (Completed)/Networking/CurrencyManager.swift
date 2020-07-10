//
//  CurrencyManager.swift
//  Currency Convertor (Starter)
//
//  Created by Ben Alemu on 6/21/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdatePrice(inputCurrency: String, outputCurrency: String, price: String)
    func didFailWithError(error: Error)
}


struct CurrencyManager {
    
    var delegate: CurrencyManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    
    #error("Generate your own API key and enter it below. Then delete this #error statement.")
    let apiKey = ""
    
    
    func getCurrencyPrice(inputCurrency: String, outputCurrency: String) {
        
        let requestURL = baseURL + "\(inputCurrency)" + "/\(outputCurrency)" + "?apikey=" + apiKey
        
        if let url = URL(string: requestURL) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let fetchedPrice = self.parseJSON(data: safeData) {
                        
                        let priceString = String(format: "%.2f", fetchedPrice)
                        
                        self.delegate?.didUpdatePrice(inputCurrency: inputCurrency, outputCurrency: outputCurrency, price: priceString)
                        
                    }
                }
            }
            
            task.resume()
        }
        
    }
    
    func parseJSON(data: Data) -> Double? {
        
        let decoder = JSONDecoder()
        
        do {
            let fetchedPrice = try decoder.decode(CurrencyData.self, from: data)
            
            //print(fetchedPrice.rate)
            
            return fetchedPrice.rate
        }
        
        catch {
            print(error)
            
            return nil
        }
        
    }
}
