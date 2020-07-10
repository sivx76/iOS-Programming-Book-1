//
//  ViewController.swift
//  Currency Convertor (Starter)
//
//  Created by Ben Alemu on 6/19/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

/*
 Challenges:
 
 Present error message on screen.
 
 Add 20 more currencies to the app.
 
 Convert from assed_id to full name and display on screen.
 
 Design a function that will compute the highest value currency.
 */

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CurrencyManagerDelegate {
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var displayLabel: UILabel!
    
    
    let currencies = ["Bitcoin", "Ethereum", "US Dollar", "Euro", "Yen", "Swiss Franc", "Pound"]
    
    let convertSelectionToParameters : [String: String] = [
        
        "Bitcoin": "BTC",
        "Ethereum": "ETH",
        "US Dollar": "USD",
        "Euro": "EUR",
        "Yen": "JPY",
        "Swiss Franc": "CHF",
        "Pound" : "GBP",
    
    ]
    
    var currencyManager = CurrencyManager()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        currencyManager.delegate = self
        
        displayLabel.text = ""
        
    }
    
    
    
    //MARK: - Currency Manager Delegate
     
    func didUpdatePrice(inputCurrency: String, outputCurrency: String, price: String) {
         
         //print("Our API call succeeded. One \(inputCurrency) equals \(price) \(outputCurrency).")
        
        DispatchQueue.main.async {
            self.displayLabel.text = "One \(inputCurrency) equals \(price) \(outputCurrency)."
        }
        
     }
     
    
     func didFailWithError(error: Error) {
         print(error)
     }
    
    
    
    // MARK: - IBActions
    
    
    @IBAction func convertPressed(_ sender: Any) {
        
        let inputValue = currencies[currencyPicker.selectedRow(inComponent: 0)]
        let outputValue = currencies[currencyPicker.selectedRow(inComponent: 1)]


//        print("inputValue: \(inputValue)")
//        print("outputValue: \(outputValue)")
//        print("---")
        
        let parameterInput = convertSelectionToParameters[inputValue]
        let parameterOutput = convertSelectionToParameters[outputValue]


//        print("paramaterInput: \(paramaterInput)")
//        print("parameterOutput: \(parameterOutput)")
        
        
        //Perform API Call
        currencyManager.getCurrencyPrice(inputCurrency: parameterInput!, outputCurrency: parameterOutput!)
        

    }
    
    
    
    @IBAction func surprisePressed(_ sender: Any) {
        
        //print("Surprise button is pressed!")
        
        let randomNumber1 = Int.random(in: 0..<currencies.count)
        let randomNumber2 = Int.random(in: 0..<currencies.count)

        let randomInput = currencies[randomNumber1]
        let randomOutput = currencies[randomNumber2]

        let parameterInput = convertSelectionToParameters[randomInput]
        let parameterOutput = convertSelectionToParameters[randomOutput]

        
        //Perform API Call
        currencyManager.getCurrencyPrice(inputCurrency: parameterInput!, outputCurrency: parameterOutput!)
        

        
    }
    
    

    
    //MARK: - Protocol Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           
        // How many columns we have
        
        return 2
       }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // Return the labels the pickerView should display
        
        return currencies[row]
    }
       
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           
        // How many rows we should display
        
        return currencies.count
       }
    
    

}

