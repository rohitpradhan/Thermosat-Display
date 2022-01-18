//
//  HumidityRepository.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//


import Foundation

typealias HumidityInfoCompletion = (_ result: Result<HumidityInfo.HumidityInfoResponse>) -> Void

protocol HumidityRepository {
    func getHumidityInfo(parameters: HumidityInfo.HumidityInfoRequest, completion: @escaping HumidityInfoCompletion)
}
