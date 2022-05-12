//
//  ViewController.swift
//  Maps-Demo
//
//  Created by Bishoy Badie on 11/05/2022.
//

import UIKit
import CoreLocation

class ReverseGeocodingViewController: UIViewController {
    
    // MARK: - Stored Properties
    @IBOutlet weak private var latitudeTextField: UITextField!
    @IBOutlet weak private var longitudeTextField: UITextField!
    @IBOutlet weak private var geocodeButton: UIButton!
    @IBOutlet weak private var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak private var locationLabel: UILabel!
    
    // MARK: - GeoCoder
    lazy var geocoder = CLGeocoder()
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        title = "Reverse Geocoding"
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.isHidden = false
    }
    
    // MARK: - Actions
    @IBAction func geocode(_ sender: UIButton) {
        guard let latAsString = latitudeTextField.text, let lat = Double(latAsString) else { return }
        guard let lngAsString = longitudeTextField.text, let lng = Double(lngAsString) else { return }
        
        // Create Location
        let location = CLLocation(latitude: lat, longitude: lng)
        
        // Geocode Location
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            self.processResponse(withPlacemarks: placemarks, error: error)
        }
        
        // Update View
        geocodeButton.isHidden = true
        activityIndicatorView.startAnimating()
    }
    
    // MARK: - Helper Methods
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        // Update View
        geocodeButton.isHidden = false
        activityIndicatorView.stopAnimating()
        
        if let error = error {
            print("Unable to Reverse Geocode Location (\(error))")
            DispatchQueue.main.async {
                self.locationLabel.text = "Unable to Find Address for Location"
            }
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                DispatchQueue.main.async {
                    self.locationLabel.text = placemark.compactAddress
                    print("Success <3")
                }
            } else {
                DispatchQueue.main.async {
                    self.locationLabel.text = "No Matching Addresses Found"
                }
            }
        }
    }
    
}
