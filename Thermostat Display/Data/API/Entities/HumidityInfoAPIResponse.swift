//
//  HumidityInfoAPIResponse.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

struct HumidityInfoAPIResponse: InitializableWithData, InitializableWithJson {
    
    var humidityInfo: HumidityInfo.HumidityInfoResponse
    
    init(data: Data?) throws {
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data),
            let json = jsonObject as? [String: Any] else {
                throw ApiError.parsingFailed
        }
        try self.init(json: json)
    }
    
    init(json: [String: Any]) throws {
        
        guard let traits = json["traits"] as? [String: Any], let humidity = traits["sdm.devices.traits.Humidity"] as? [String: Any], let ambientHumidityPercent = humidity["ambientHumidityPercent"] as? Float else {
            throw ApiError.parsingFailed
        }
        self.humidityInfo = HumidityInfo.HumidityInfoResponse(ambientHumidityPercent: ambientHumidityPercent)
    }
}
