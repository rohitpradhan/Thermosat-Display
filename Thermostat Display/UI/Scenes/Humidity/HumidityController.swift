//
//  HumidityController.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 13/01/22.
//

import Foundation
import UIKit

private struct ViewStrings {
    static let ambientHumidityLevel = "Ambient Humdity Level"
}

class HumidityViewController: UIViewController {
    var presenter: HumidityPresenter!
    var configurator: HumidityConfigurator!
    
    @IBOutlet weak var ambientHumidityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        presenter.viewDidLoad()
    }
}

extension HumidityViewController: HumidityView {

    func setAmbientHumidityPercent(humidity: Float) {
        ambientHumidityLabel.text = ViewStrings.ambientHumidityLevel + "\(humidity)"
    }

    func showFailure(error: Error) {
        self.showAlert(withTitle: "Error", withMessage: error.localizedDescription)
    }

}
