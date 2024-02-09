//
//  BillGuardApp.swift
//  BillGuard
//
//  Created by Martin Navarro on 8/2/24.
//

import SwiftUI
import FirebaseCore

@main
struct BillGuardApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
