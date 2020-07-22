//
//  ContentView.swift
//  A CarPlay Route Planner
//
//  Created by Volker Bach on 22.07.20.
//  Copyright © 2020 Volker Bach. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    // 1.
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    // 2.
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        // 3.
        let location = CLLocationCoordinate2D(latitude: 55.5847374120105,
            longitude: 12.2576344182219)
        // 4.
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        uiView.setRegion(region, animated: true)
        
        // 5.
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Ionity"
        annotation.subtitle = "Greve, DK"
        uiView.addAnnotation(annotation)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            MapView()
            .navigationBarTitle(Text("A CarPlay Route Planner"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
