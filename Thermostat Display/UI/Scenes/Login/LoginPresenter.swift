//
//  LoginPresenter.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation
import UIKit

protocol LoginView: class {
    func showError(error: Error)
}

protocol LoginPresenter {
    var router: LoginViewRouter { get }
    func googleSignIn(viewController: UIViewController)
}

class LoginPresenterImplementation: LoginPresenter {
    fileprivate weak var view: LoginView?
    private(set) var router: LoginViewRouter
    private let loginService: LoginService

    init(view: LoginView,
         router: LoginViewRouter, loginService: LoginService) {
        self.view = view
        self.router = router
        self.loginService = loginService
    }

    // MARK: - API Calls
    func googleSignIn(viewController: UIViewController) {
        loginService.login(viewController: viewController) { [weak self] status in
            if let `self` =  self {
                switch status {
                    case .success(let response):
                       self.processLoginResponse(response)

                    case .failed(let error):
                        self.processError(error: error)

                }
            }
        }
    }

    private func processLoginResponse(_ response: SocialResponse) {
        UserDefaults.standard.setValue(response.authToken, forKey: AppConstants.sessionTokenKey)
        UserDefaults.standard.synchronize()
        router.navigateToHumidityViewController()
    }

    private func processError(error: ApiError) {
        view?.showError(error: error)
    }
}

