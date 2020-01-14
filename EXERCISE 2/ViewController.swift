//
//  ViewController.swift
//  EXERCISE 2
//
//  Created by MacStudent on 2020-01-14.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let latitude: CLLocationDegrees = 43.64
        let longitude: CLLocationDegrees = -79.38
        
        // define delta latitude and longitude
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        // define span
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        // define location
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        // define the region
        let region = MKCoordinateRegion(center: location, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        mapView.addGestureRecognizer(uilpgr)
    }

    @objc func longPress(gestureRecognizer: UIGestureRecognizer) {
           let touchPoint = gestureRecognizer.location(in: mapView)
           let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
           
           let annotation = MKPointAnnotation()
           annotation.title = "place to visit"
           annotation.coordinate = coordinate
           mapView.addAnnotation(annotation)
       }

}

