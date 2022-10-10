//
//  DamView.swift
//  Demo
//
//  Created by Kyle Wang on 2022/8/25.
//

import SwiftUI
import MapKit

struct DamView: View {
    let place: IdentifiablePlace
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("dji-0872")
                .resizable()
                .scaledToFit()
            Text(place.name)
            Text(place.loc)
            Text(place.index)
            Text(place.status)
        }
    }
}

//struct DamView_Previews: PreviewProvider {
//    static var previews: some View {
//        DamView(place: IdentifiablePlace(location: CLLocationCoordinate2D(latitude: 24.807523, longitude: 121.305990), name: "Shimen Reservior"))
//    }
//}
