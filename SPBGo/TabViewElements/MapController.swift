//
//  MapController.swift
//  SPBGo
//
//  Created by Andrey on 03.11.2022.
//

import UIKit
import MapKit
import CoreLocation
class MapController: UIViewController, CLLocationManagerDelegate {
    var coordinatesManager = CLLocationManager();
    @IBOutlet weak var MapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map MAP")
        
    }
    override func viewDidAppear(_ animated: Bool) {
        coordinatesManager.delegate = self;
        coordinatesManager.desiredAccuracy = kCLLocationAccuracyBest;
        coordinatesManager.requestWhenInUseAuthorization();
        coordinatesManager.startUpdatingLocation();
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        if let location = locations.first {
         manager.stopUpdatingLocation();
            renderMap(location:location);
        }
    }
    func renderMap(location:CLLocation){
        var coordinates = CLLocationCoordinate2D(latitude:location.coordinate.latitude, longitude:location.coordinate.longitude)
        var span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        var region = MKCoordinateRegion(center: coordinates, span: span)
        MapView.setRegion(region, animated: true)
        var myGeoPosition = MKPointAnnotation();
        myGeoPosition.coordinate = coordinates
        MapView.addAnnotation(myGeoPosition)
    }
    

}
