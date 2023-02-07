//
//  MapView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//
import MapKit
import SwiftUI

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.2455, longitude:6.0209 ),span:MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
    Map(coordinateRegion: $region ,showsUserLocation: true)
           // .ignoresSafeArea()
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
