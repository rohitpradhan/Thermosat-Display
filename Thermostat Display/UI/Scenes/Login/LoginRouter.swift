//
//  LoginRouter.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation
import UIKit

protocol LoginViewRouter {
    func navigateToHumidityViewController()
}

class LoginViewRouterImplementation: LoginViewRouter {
    fileprivate weak var viewController: LoginViewController?
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    // MARK: - LoginRouter
    
    func navigateToHumidityViewController() {
        if let humidityVc = RouterUtility.getHumidityController()  {
            self.viewController?.navigationController?.pushViewController(humidityVc, animated: true)
            humidityVc.configurator = HumidityConfiguratorImplementation()
        }
    }

}
