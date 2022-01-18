//
//  HumidityRepositoryImpl.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

class HumidityRepositoryImpl: HumidityRepository {

    let apiClient: ApiClient

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }


    func getHumidityInfo(parameters: HumidityInfo.HumidityInfoRequest, completion: @escaping HumidityInfoCompletion) {
        let humidityInfoRequest = HumidityInfoRequest(params: parameters)
        apiClient.execute(request: humidityInfoRequest) { (result: Result<ApiResponse<HumidityInfoAPIResponse>>) in
            switch result {
                case let .success(response):
                    let humidityInfo = response.entity.humidityInfo
                    completion(.success(humidityInfo))
                case let .failure(error):
                    completion(.failure(error))
            }
        }
    }

}
