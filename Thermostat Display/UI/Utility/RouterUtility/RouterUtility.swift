//
//  RouterUtility.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//


import UIKit

protocol StoryboardProvider: AnyObject {
    static var identifier: String { get }
}

extension StoryboardProvider {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardProvider {}

class RouterUtility {
    private struct StoryBoard {
        static let Main = "Main"
    }

    class func getStoryboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }

    class func getLoginController() -> LoginViewController? {
        return getStoryboard(name: StoryBoard.Main).instantiateViewController(withIdentifier: String(describing: LoginViewController.self)) as? LoginViewController
    }

    class func getHumidityController() -> HumidityViewController? {
        return getStoryboard(name: StoryBoard.Main).instantiateViewController(withIdentifier: String(describing: HumidityViewController.self)) as? HumidityViewController
    }
    
}
