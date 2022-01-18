//
//  GoogleLoginService.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import UIKit
import GoogleSignIn

// MARK: - Response Entity
struct SocialResponse {
    var name: String
    var userId: String
    var authToken: String
}

// MARK: - Result type
enum LoginStatus {
    case success(SocialResponse)
    case failed(ApiError)
}

typealias SignInResponse = (LoginStatus) -> Void

protocol LoginService: AnyObject {
    func login(viewController: UIViewController, completionHandler: @escaping SignInResponse)
}

class GoogleLoginService: NSObject, LoginService {
    var viewController: UIViewController?
    private var googleResponse: SignInResponse!
    
    func login(viewController: UIViewController, completionHandler: @escaping SignInResponse) {
        self.signInWithGoogle(viewController: viewController, completionHandler: completionHandler)
    }
}

extension GoogleLoginService: GIDSignInDelegate {

    func signInWithGoogle(viewController: UIViewController, completionHandler: @escaping SignInResponse) {
        self.viewController = viewController
        googleResponse = completionHandler
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = viewController
        GIDSignIn.sharedInstance().signIn()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            // Perform any operations on signed in user here.
            if let fullName = user.profile.name,
                let idToken = user.userID,
                let authToken = user.authentication.idToken {
                googleResponse(.success(SocialResponse(name: fullName, userId: idToken, authToken: authToken)))
            } else {
                googleResponse(.failed(ApiError.loginFailed))
            }

        } else {
            googleResponse(.failed(ApiError.loginFailed))
        }
    }

    func sign(_ signIn: GIDSignIn!,
              present viewController: UIViewController!) {
        viewController.present(viewController, animated: true, completion: nil)
    }

    func sign(_ signIn: GIDSignIn!,
              dismiss viewController: UIViewController!) {
        viewController.dismiss(animated: true, completion: nil)
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
        print("didDisconnectWith")
    }

    func sign(inWillDispatch signIn: GIDSignIn?, error: Error?) {
         print("Will dispatch")
    }
}
