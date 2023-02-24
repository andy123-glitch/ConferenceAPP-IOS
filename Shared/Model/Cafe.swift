//
//  Cafe.swift
//  Projet (iOS)
//
//  Created by marchal valentin on 20/02/2023.
//

import Foundation
import MapKit

struct Cafe: Codable, Hashable, Identifiable {
    var id:String
    var name:String
    var imageurl:URL
    var address:String
    var latitude:String
    var longitude:String
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: Double(latitude) ?? 0, longitude: Double(longitude) ?? 0)
        }
}

struct CafeResponse: Decodable {
    var records: [Cafe]
}
