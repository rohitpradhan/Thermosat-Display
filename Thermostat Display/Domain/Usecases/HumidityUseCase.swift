//
//  HumidityUseCase.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

protocol HumidityUseCase {
    func getHumidityInfo(parameters: HumidityInfo.HumidityInfoRequest, completion: @escaping HumidityInfoCompletion)
}

class HumidityUseCaseImpl: HumidityUseCase {
    
    let repository: HumidityRepository

    init(repository: HumidityRepository) {
        self.repository = repository
    }

    
    func getHumidityInfo(parameters: HumidityInfo.HumidityInfoRequest, completion: @escaping HumidityInfoCompletion) {
        self.repository.getHumidityInfo(parameters: parameters, completion: completion)
    }
}
