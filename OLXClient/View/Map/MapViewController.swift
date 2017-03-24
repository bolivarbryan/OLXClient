//
//  MapViewController.swift
//  OLXClient
//
//  Created by Bryan on 24/03/17.
//  Copyright © 2017 Bolivarbryan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var viewModel: ItemViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapInCoordinate()
        self.title = viewModel.titleText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Methods
    func centerMapInCoordinate()  {
        var region = MKCoordinateRegion()
        region.center = CLLocationCoordinate2D(latitude: viewModel.coordinate.latitude, longitude: viewModel.coordinate.longitude)
        region.span.latitudeDelta = 2.0;
        region.span.longitudeDelta = 2.0;
        mapView.region = region;
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = region.center
        dropPin.title = viewModel.displayLocationText
        dropPin.subtitle = viewModel.titleText
        mapView.addAnnotation(dropPin)
    }
}
