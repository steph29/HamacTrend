//
//  MapView.swift
//  HamacTrend
//
//  Created by stephane verardo on 14/01/2020.
//  Copyright © 2020 stephane verardo. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    var coordinates: CLLocationCoordinate2D
    let landmarks = LandmarkAnnotation.requestMockData()

        func makeUIView(context: Context) -> MKMapView{
                MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        view.delegate = context.coordinator
        view.addAnnotations(landmarks)
    }
    
    func makeCoordinator() -> MapViewCoordinator{
         MapViewCoordinator(self)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinates: landmarkData[0].locationCoordinate)
    }
}
