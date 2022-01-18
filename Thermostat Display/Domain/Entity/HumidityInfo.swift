
//
//  HumidityInfo.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

struct HumidityInfo {
    
    struct HumidityInfoRequest {
        var projectId: String
        var deviceId: String
    }
    
    struct HumidityInfoResponse {
        var ambientHumidityPercent: Float
    }
}
