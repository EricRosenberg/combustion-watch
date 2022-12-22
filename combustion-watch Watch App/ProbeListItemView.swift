//
//  ProbeListItemView.swift
//  combustion-watch Watch App
//
//  Created by Eric Rosenberg on 12/21/22.
//

import SwiftUI
import CombustionBLE

struct ProbeListItemView: View {
    @ObservedObject var probe: Probe
    
    var body: some View {
        HStack{
            Text("Probe \(self.probe.name)").padding(.trailing)
            ZStack {
                CircularProgressView(progress: getProgressPercentage(probe: probe))
                Text(getCoreTempString(probe:probe))
            }.padding()
        }
    }
}

struct ProbeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProbeListItemView(probe: SimulatedProbe())
    }
}
