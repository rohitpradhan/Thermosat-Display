//
//  UseCaseLocator.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//
import Foundation

protocol UseCaseLocator {
    func getUseCase<T>(ofType type: T.Type) -> T?
}

class UseCaseLocatorImpl: UseCaseLocator {

    private lazy var apiClient = ApiClientImplementation()
    
    private lazy var humidityRepository = HumidityRepositoryImpl(apiClient: apiClient)


    func getUseCase<T>(ofType type: T.Type) -> T? {
        switch String(describing: type) {
        case String(describing: HumidityUseCase.self):
            return self.buildHumidityUseCase() as? T

            
        default:
            return nil
        }
    }
}

extension UseCaseLocatorImpl {

    func buildHumidityUseCase() -> HumidityUseCase {
        return HumidityUseCaseImpl(repository: humidityRepository)
    }


}
