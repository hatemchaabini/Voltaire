//
//  Enum.swift
//  Voltaire
//
//  Created by Hatem Chaabini on 22/06/2022.
//

import MapKit
import Alamofire

import Foundation
enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta:0.01,longitudeDelta:0.01)
    static let zoomSpan = MKCoordinateSpan(latitudeDelta:0.05,longitudeDelta:0.05)
    static let zoomSpanIn = MKCoordinateSpan(latitudeDelta:0.001,longitudeDelta:0.001)

    static let headers : HTTPHeaders = [
        "Accept": "application/json"
    ]

}
