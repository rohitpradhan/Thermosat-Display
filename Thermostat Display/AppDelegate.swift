//
//  AppDelegate.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import UIKit
import GoogleSignIn

private struct APIKeys {
    static let cliendId = "763462181157-vfe41akfro9drlaifmuoinhtn42uuugp.apps.googleusercontent.com"
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.window = UIWindow(frame: UIScreen.main.bounds)
        GIDSignIn.sharedInstance().clientID = APIKeys.cliendId

        window?.backgroundColor = .white

        let navController = UINavigationController()
        if let rootController = RouterUtility.getLoginController() {
            navController.viewControllers = [rootController]
        }
        window?.rootViewController = navController
        return true
    }

}

