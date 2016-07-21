//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Joe Stevens on 7/19/16.
//  Copyright © 2016 Joe Stevens. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController{
    
    var mapView: MKMapView!
    
    override func loadView() {
        //Create MapView 
        mapView = MKMapView()
        
        //Set it as *the* view of this view controller
        view = mapView
        
        let segmentedControl
            = UISegmentedControl(items: ["Standard", "Hybrid", "Satelite"])
        segmentedControl.backgroundColor
            = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint
            = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let leadingConstraint
            = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
        let trailingConstraint
            = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController loaded its view")
        
    }
    
        
    
}
