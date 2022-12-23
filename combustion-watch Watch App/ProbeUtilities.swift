//
//  ProbeUtilities.swift
//  combustion-watch Watch App
//
//  Created by Eric Rosenberg on 12/21/22.
//

import Foundation
import CombustionBLE

public func getProgressPercentage(probe: Probe) -> Double {
    if (probe.predictionStatus != nil) {
        return probe.virtualTemperatures!.coreTemperature / probe.predictionStatus!.predictionSetPointTemperature
    } else {
        // Fix this to actually handle errors
        return 0.0
    }
}

public func getCoreTempString(probe: Probe) -> String {
    if probe.virtualTemperatures != nil {
        
        return "\(Int(fahrenheit(celsius: probe.virtualTemperatures!.coreTemperature))) °F "
    } else {
        // Fix this to actually handle errors
        return "Error"
    }
}

public func getTargetTempString(probe: Probe) -> String {
    if probe.hasActivePrediction {
        return "\(Int(fahrenheit(celsius: probe.predictionStatus!.predictionSetPointTemperature))) °F "
    } else {
        // Fix this to actually handle errors
        return "Error"
    }
}

public func getPredictedTimeRemaining(probe: Probe) -> String {
    if probe.hasActivePrediction && probe.predictionStatus != nil {
        if probe.predictionStatus?.predictionState == PredictionState.probeNotInserted {
            return "Not Inserted"
        } else {
            let time = probe.predictionStatus?.predictionValueSeconds ?? 0;
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            return "Time: \(formatter.string(from: TimeInterval(time))!)"
        }
    } else {
        return "No Prediction Available"
    }
}
