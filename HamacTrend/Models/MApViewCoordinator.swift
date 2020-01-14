//
//  MApViewCoordinator.swift
//  SpotAHamac
//
//  Created by stephane verardo on 13/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import Foundation
import MapKit

class MapViewCoordinator: NSObject, MKMapViewDelegate{
    var mapViewController: MapView
    
    init(_ control: MapView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "CustomView")
        annotationView.canShowCallout = true
        annotationView.image = UIImage(named: "woodland")
        return annotationView
    }
}
