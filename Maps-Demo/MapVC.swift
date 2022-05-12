//
//  MapVC.swift
//  Maps-Demo
//
//  Created by Bishoy Badie on 12/05/2022.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 30.31, longitude: 31.3124, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 30.31, longitude: 31.3124)
        marker.title = "EVA"
        marker.snippet = "HARAM"
        marker.map = mapView
  }
}

      
