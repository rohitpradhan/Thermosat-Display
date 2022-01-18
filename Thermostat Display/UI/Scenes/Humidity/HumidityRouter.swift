//
//  HumidityRouter.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 13/01/22.
//

import Foundation
import UIKit

protocol HumidityViewRouter {
    func dismiss()
}

class HumidityViewRouterImplementation: HumidityViewRouter {
    fileprivate weak var viewController: HumidityViewController?
    
    init(viewController: HumidityViewController) {
        self.viewController = viewController
    }
    
    // MARK: - HumidityRouter
    
    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
