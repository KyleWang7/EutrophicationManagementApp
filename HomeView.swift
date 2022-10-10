//
//  HomeView.swift
//  IGEM Software
//
//  Created by Kyle Wang on 2022/8/25.
//

import SwiftUI

struct HomeView: View{
    var body: some View{
        NavigationView {
            VStack{
                Text("First Screen")
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
