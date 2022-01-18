//
//  UIWindowExtension.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import UIKit

extension UIWindow {
    static var keyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
