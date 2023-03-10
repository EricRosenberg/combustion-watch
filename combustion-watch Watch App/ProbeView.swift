//
//  SimpleView.swift
//  combustion-watch Watch App
//
//  Created by Eric Rosenberg on 12/21/22.
//

import SwiftUI
import CombustionBLE

struct ProbeView: View {
    @ObservedObject var probe: Probe
    
    init(probe: Probe) {
        self.probe = probe
        if self.probe.connectionState != .connected {
//            self.probe.connect()
        }
    }
    
    var body: some View {
        VStack {
            // TODO: Move detection of missing predictions higher up the stack to be rendered in a separate View
            if (probe.virtualTemperatures != nil && probe.predictionStatus != nil) {
                ZStack {
                    CircularProgressView(progress: getProgressPercentage(probe: probe))
                    VStack {
                        Text("Core: \(getCoreTempString(probe: probe))").font(.title3).bold()
                        Text("Target: \(getTargetTempString(probe: probe))").font(.subheadline)
                        Text(getPredictedTimeRemaining(probe: probe)).font(.subheadline)
                    }
                }
            } else {
                Text("Connecting to probe...")
            }
        }.padding()
    }
}


struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        ProbeView(probe: SimulatedProbe())
    }
}
