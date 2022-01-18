//
//  LoginController.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!

    var presenter: LoginPresenter!
    var configurator: LoginConfigurator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator = LoginConfiguratorImplementation()
        configurator.configure(viewController: self)
    }

    @IBAction func loginWithGoogleTapped(_ sender: Any) {
        presenter.googleSignIn(viewController: self)
    }

}

extension LoginViewController: LoginView {
    func showError(error: Error) {
        self.showAlert(withTitle: "Error", withMessage: error.localizedDescription)
    }

}
