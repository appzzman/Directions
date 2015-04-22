//
//  ViewController.swift
//  Directions
//
//  Created by Janusz Chudzynski on 4/22/15.
//  Copyright (c) 2015 Janusz Chudzynski. All rights reserved.
//

import UIKit
import MapKit
import AddressBook

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let coreLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        coreLocationManager.requestAlwaysAuthorization()

        mapView.delegate = self
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func displayDirections(sender: AnyObject) {

        //get coordinates of the location you want to display
        let cords = CLLocationCoordinate2D(latitude: 30.5495, longitude: -87.2181)
        //specify visible region
        let region:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(cords, 10000.0, 10000.0)
        //specify address metadata displayed in Maps app
        let address:[NSObject:NSString] = [
            kABPersonAddressStreetKey:"11000 University Pkwy",
            kABPersonAddressCityKey: "Pensacola",
            kABPersonAddressStateKey: "FL",
            kABPersonAddressZIPKey: "32514",
            kABPersonAddressCountryCodeKey: "US"]
        
        let placemark = MKPlacemark(coordinate: cords, addressDictionary: address)
        let mapItem = MKMapItem(placemark: placemark)

        //Specify options of how the Maps app will display the map item  
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
         mapItem.openInMapsWithLaunchOptions(options)
        
    }
    
    
    
    

}

