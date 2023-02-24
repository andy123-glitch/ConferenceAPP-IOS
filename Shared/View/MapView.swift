//
//  MapView.swift
//  Projet (iOS)
//
//  Created by azerot andy on 23/01/2023.
//
import MapKit
import SwiftUI



struct MapView: View {
    
    @StateObject var viewModel = ConferenceViewModel()
    
    @State private var showingSheet = false
    @State var cafeId =  ""
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.48141611907641, longitude:6.84082989999238 ),span:MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .success(let cafes):
                Map(coordinateRegion: $region ,showsUserLocation: true,
                    annotationItems: cafes.records, annotationContent: { cafe in
                    MapAnnotation(coordinate: cafe.coordinate){
                        Circle().onTapGesture(perform: {
                            cafeId = cafe.id
                            showingSheet.toggle()
                        })
                    }
                                              
                }).sheet(isPresented: $showingSheet) {
                    SheetView(cafeId: cafeId)
                }
                        .ignoresSafeArea()
            case .loading:
                ProgressView()
            default:
                EmptyView()
            }
        }
        .task {
            await viewModel.getCafes()
        }
    
        
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
