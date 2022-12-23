//
//  ProbeListView.swift
//  combustion-watch Watch App
//
//  With inspiration from: https://github.com/combustion-inc/combustion-ios-example/blob/develop/Combustion%20iOS%20Example/Combustion%20iOS%20Example/EngineeringScreens/EngineeringProbeList.swift
//
//  Created by Eric Rosenberg on 12/21/22.
//

import SwiftUI
import CombustionBLE

struct ProbeListView: View {
    
    @ObservedObject var deviceManager = DeviceManager.shared
    
    var body: some View {
        NavigationView {
            List{
                ForEach(deviceManager.getProbes(), id: \.self) { probe in
                    NavigationLink(destination: ProbeView(probe: probe)){
                        ProbeListItemView(probe: probe).onAppear {
                            if (probe.isConnectable && probe.connectionState != .connected) {
                                probe.connect()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ProbeListView_Previews: PreviewProvider {
    static var previews: some View {
        ProbeListView()
    }
}
