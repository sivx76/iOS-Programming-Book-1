//
//  MapViewController.swift
//  Olympic Maps (Completed)
//
//  Created by Ben Alemu on 6/25/20.
//  Copyright © 2020 Ben Alemu. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var googleMap: GMSMapView!
    
    var olympicGames = OlympicSeries().gamesSince2000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let camera = GMSCameraPosition.camera(withLatitude: olympicGames[0].latitude, longitude: olympicGames[0].longitude, zoom: 3)
        
        googleMap.camera = camera
        googleMap.delegate = self   //so can recognize taps
        showMarkers()
    }
    
    
    func showMarkers() {             // Will place markers on specific locations on our map
        
        for game in olympicGames {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: game.latitude, longitude: game.longitude)
            marker.title = game.hostCity
            marker.snippet = "Olympic game \(game.year) in \(game.hostCity), \(game.hostNation) "
            marker.map = googleMap
        }
        
        
    }
        
    
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("Clicked on \(marker.title)")
    }
}
