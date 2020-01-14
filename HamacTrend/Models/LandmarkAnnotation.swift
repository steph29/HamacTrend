//
//  LandmarkAnnotation.swift
//  SpotAHamac
//
//  Created by stephane verardo on 13/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit


class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
init(title: String?,
     subtitle: String?,
     coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }

    static func requestMockData()-> [LandmarkAnnotation]{
        return [
            LandmarkAnnotation(title: "Riec-Sur-Belon",
                               subtitle:"Face à la mer, proche du GR34",
                               coordinate: .init(latitude: 47.824149, longitude: -3.697283)),
            LandmarkAnnotation(title: "Séné",
                               subtitle:"Face au golf du Morbihan",
                               coordinate: .init(latitude: 47.6000082, longitude: -2.7335596))
        ]
    }
}
