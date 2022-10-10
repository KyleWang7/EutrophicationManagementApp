//
//  IGEM_SoftwareApp.swift
//  IGEM Software
//
//  Created by Kyle Wang on 2022/8/13.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct IGEM_SoftwareApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if let user = Auth.auth().currentUser {
                ContentView()
            } else {
                LoginView()

            }
        }
    }
}
