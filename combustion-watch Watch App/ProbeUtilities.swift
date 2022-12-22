//
//  ProbeUtilities.swift
//  combustion-watch Watch App
//
//  Created by Eric Rosenberg on 12/21/22.
//

import Foundation
import CombustionBLE

public func getProgressPercentage(probe: Probe) -> Double {
    if (probe.hasActivePrediction) {
        return probe.virtualTemperatures!.coreTemperature / probe.predictionStatus!.predictionSetPointTemperature
    } else {
        // Fix this to actually handle errors
        return Double.random(in: 0 ..< 1)
    }
}

public func getCoreTempString(probe: Probe) -> String {
    if probe.virtualTemperatures != nil {
        return "\(Int(probe.virtualTemperatures!.coreTemperature)) °F "
    } else {
        // Fix this to actually handle errors
        return "Error"
    }
}

public func getTargetTempString(probe: Probe) -> String {
    if probe.hasActivePrediction {
        return "\(Int(probe.predictionStatus!.predictionSetPointTemperature)) °F "
    } else {
        // Fix this to actually handle errors
        return "Error"
    }
}

public func getPredictedTimeRemaining(probe: Probe) -> String {
    if probe.hasActivePrediction {
        let time = probe.predictionStatus?.predictionValueSeconds ?? 0;
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: TimeInterval(time))!
    } else {
        return "00:00:00 - error"
    }
}
