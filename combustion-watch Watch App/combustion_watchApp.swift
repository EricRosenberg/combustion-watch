//
//  combustion_watchApp.swift
//  combustion-watch Watch App
//
//  Created by Eric Rosenberg on 12/21/22.
//

import SwiftUI
import CombustionBLE

@main
struct combustion_watch_Watch_AppApp: App {
    @State var currentTemp: Int = 0
    @State var time: Int = 0
    @State var targetTemp: Int = 0
    
    @ObservedObject var deviceManager = DeviceManager.shared
    
    init() {
        // Initialize bluetooth
        DeviceManager.shared.initBluetooth()

        // Simulate Probes
         self.deviceManager.addSimulatedProbe()
        self.deviceManager.addSimulatedProbe()
        self.deviceManager.addSimulatedProbe()
    }
    
    var body: some Scene {
        WindowGroup {
            ProbeListView()
        }
    }
}
