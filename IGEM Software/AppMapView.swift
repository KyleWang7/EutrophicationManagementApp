//
//  ContentView.swift
//  Demo
//
//  Created by Kyle Wang on 2022/8/25.
//

import SwiftUI
import MapKit

struct IdentifiablePlace: Identifiable {
    let id = UUID()
    let location: CLLocationCoordinate2D
    let name: String
    let loc: String
    let index: String
    let status: String
    
}

struct AppMapView: View {
    @State var showDam: IdentifiablePlace?
    let places = [
        IdentifiablePlace(location: CLLocationCoordinate2D(latitude: 24.807523, longitude: 121.305990), name: "Reservior Name: Shimen Reservior", loc: "Reservior Location: Taoyuan City", index: "Eutrophication Index: Eutrophic", status: "Eutrophication Status: Recently, eutrophication in Shimen Reservoir has decreased gradually, yet the total concentration of phosphorus is still exceptionally high because of the pollution emitted by the adjacent frequent constructions."),
        
        IdentifiablePlace(location: CLLocationCoordinate2D(latitude: 23.247242, longitude: 120.540160), name: "Reservior Name: Tseng-Wen Reservoir", loc: "Reservior Location: Chiayi City", index: "Eutrophication Index: Eutrophic", status: "Eutrophication Status: The location of the adjacent disposal area and the increasing garbage pollution results in the sedimentary deposits and abundant suspended solid. This results in the turbid water quality while decreasing the water transparency, making the extent of eutrophication high."),
        
        IdentifiablePlace(location: CLLocationCoordinate2D(latitude: 24.934703, longitude: 121.623425), name: "Reservior Name: Feicui Reservoir", loc: "Reservior Location: New Taipei City", index: "Eutrophication Index: Eutrophic", status: "Eutrophication Status: In the past decades, the CTSI of the Feicui Reservoir has indeed shown a decreasing trend year by year, which means that the water quality is gradually improving. However, seasonal changes, temperature, and rainfall still affect the water quality significantly."),
    
    ]
    
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 24.137054, longitude: 120.686845), latitudinalMeters: 300000, longitudinalMeters: 300000)
    
    
  
    var body: some View {
     
        Map(coordinateRegion: $region, annotationItems: places) { place in
            MapAnnotation(coordinate: place.location) {
                Image(systemName:"location.fill")
                    .foregroundColor(.red)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        print(place.location)
                        showDam = place
                    }
            }
        }
        .sheet(item: $showDam) { dam in
            DamView(place: dam)
        }
    }
}

struct AppMapView_Previews: PreviewProvider {
    static var previews: some View {
        AppMapView()
    }
}
