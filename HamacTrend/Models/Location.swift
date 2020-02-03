//
//  Location.swift
//  HamacTrend
//
//  Created by stephane verardo on 27/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

class Location: NSObject, CLLocationManagerDelegate {
      var manager = CLLocationManager()
            let regionInMeters: Double = 750
            var previousLocation: CLLocation?
        
            func checkLocationServices() {
                   if CLLocationManager.locationServicesEnabled() {
                    setupLocationManager()
                    checkLocationAuthorization()
                   } else {
                       
                   }
               }
            
            func checkLocationAuthorization() {
                switch CLLocationManager.authorizationStatus() {
                case .authorizedWhenInUse:
                    manager.startUpdatingLocation()
                case .denied:
                    break
                case .notDetermined:
                    manager.requestWhenInUseAuthorization()
                case .restricted:
                    // Alert leur expliquant pourquoi c'est bloqué: controle parental ...
                    break
                case .authorizedAlways:
                    break
                }
            }
            func setupLocationManager() {
                manager.delegate  = self
                manager.desiredAccuracy = kCLLocationAccuracyBest
            }
            
        }

extension Location: MKMapViewDelegate  {
            
           func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
                guard let location = locations.last else { return}
                let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
          }
            
            func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
                checkLocationAuthorization()
                
            }
}

