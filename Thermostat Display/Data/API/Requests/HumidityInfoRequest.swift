//
//  HumidityInfoRequest.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

struct HumidityInfoRequest: ApiRequest {
    
    let params: HumidityInfo.HumidityInfoRequest
    
    var urlRequest: URLRequest {

        let urlString = "https://smartdevicemanagement.googleapis.com/v1"
        let url: URL! = URL(string: urlString +  "/enterprises/" + params.projectId + "/devices/" + params.deviceId )
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get

        let token = getToken()
        
        let headers = [
            "token": token
        ]
        request.allHTTPHeaderFields = headers
        return request
    }
}

extension HumidityInfoRequest {
    
    func getToken() -> String {
        return TokenManager.shared.getAccessToken()
    }
}
