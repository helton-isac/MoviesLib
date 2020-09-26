//
//  MapViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 26/09/20.
//  Copyright © 2020 FIAP. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var mapView: MKMapView!
    
    // MARK: - Properties
    lazy var locationManager = CLLocationManager()
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        requestAuthorization()
    }
    
    
    // MARK: - IBActions
    
    
    // MARK: - Methods
    private func setupView() {
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.delegate = self
        searchBar.delegate = self
        
    }
    
    private func requestAuthorization() {
        //CLLocationManager.locationServicesEnabled()
        locationManager.requestWhenInUseAuthorization()
    }
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let request = MKLocalSearch.Request()
        request.region = mapView.region
        request.naturalLanguageQuery = searchBar.text
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if error == nil {
                guard let response = response else { return }
                self.mapView.removeAnnotations(self.mapView.annotations)
                for item in response.mapItems {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = item.placemark.coordinate
                    annotation.title = item.name
                    annotation.subtitle = item.url?.absoluteString
                    self.mapView.addAnnotation(annotation)
                }
                self.mapView.showAnnotations(self.mapView.annotations, animated: true)
            }
        }
    
    }
}

