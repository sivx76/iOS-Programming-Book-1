//
//  Olympic Series.swift
//  Olympic Maps (Completed)
//
//  Created by Ben Alemu on 6/25/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import Foundation
import CoreLocation

struct OlympicSeries {
    
    var gamesSince2000 = [OlympicGame]()
    
    
    init() {
        let Olympics2000 = OlympicGame(hostCity: "Sydney", hostNation: "Australia", year: 2000, motto: "The games of the new millennium. Share the Spirit - Dare to dream", latitude: -33.870453, longitude: 151.208755, leadingNation: "United States", leaderMedals: 93)
        
        let Olympics2004 = OlympicGame(hostCity: "Athens", hostNation: "Greece", year: 2004, motto: "Welcome Home", latitude: 37.983810, longitude: 23.727539, leadingNation: "United States", leaderMedals: 101)
        
        let Olympics2008 = OlympicGame(hostCity: "Beijing", hostNation: "China", year: 2008, motto: "One World, One Dream", latitude: 39.916668, longitude: 116.383331, leadingNation: "China", leaderMedals: 100)
        
        let Olympics2012 = OlympicGame(hostCity: "London", hostNation: "United Kingdom", year: 2012, motto: "Inspire a Generation", latitude: 51.509865, longitude: -0.118092, leadingNation: "United States", leaderMedals: 104)
        
        let Olympics2016 = OlympicGame(hostCity: "Rio de Janeiro", hostNation: "Brazil", year: 2016, motto: "A new world", latitude: -22.908333, longitude: -43.196388, leadingNation: "United States", leaderMedals: 121)
        
        
        gamesSince2000.append(Olympics2000)
        gamesSince2000.append(Olympics2004)
        gamesSince2000.append(Olympics2008)
        gamesSince2000.append(Olympics2012)
        gamesSince2000.append(Olympics2016)

    }
    
}
