//
//  LoginConfigurator.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

protocol LoginConfigurator {
    func configure(viewController: LoginViewController)
}

class LoginConfiguratorImplementation: LoginConfigurator {
    func configure(viewController: LoginViewController) {
        let router = LoginViewRouterImplementation(viewController: viewController)
        let loginService = GoogleLoginService()
        let presenter = LoginPresenterImplementation(view: viewController, router: router, loginService: loginService)
        viewController.presenter = presenter
    }
}

