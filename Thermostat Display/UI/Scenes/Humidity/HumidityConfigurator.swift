//
//  HumidityConfigurator.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 13/01/22.
//

import Foundation

protocol HumidityConfigurator {
    func configure(viewController: HumidityViewController)
}

class HumidityConfiguratorImplementation: HumidityConfigurator {
    func configure(viewController: HumidityViewController) {
        let router = HumidityViewRouterImplementation(viewController: viewController)
        let useCaseLocator = UseCaseLocatorImpl()
        let presenter = HumidityPresenterImplementation(view: viewController, router: router, useCaseLocator: useCaseLocator)
        viewController.presenter = presenter
    }
}

