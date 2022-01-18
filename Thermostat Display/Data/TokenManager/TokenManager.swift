//
//  TokenManager.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation
import GoogleSignIn

class TokenManager {
    static var shared = TokenManager()

    private init() {}

    func getAccessToken() -> String {

        if  let token = GIDSignIn.sharedInstance()?.currentUser?.authentication?.accessToken {
             return token
         } else {
             return ""
         }
    }

    func getAccessToken( handler: @escaping (String) -> Void) {
        GIDSignIn.sharedInstance()?.currentUser?.authentication?.getTokensWithHandler { authentication, error in
            if error == nil {
                handler(authentication?.accessToken ?? "")
            } else {
                let token = GIDSignIn.sharedInstance()?.currentUser?.authentication?.accessToken ?? ""
                handler(token)
            }
        }
    }

    func refreshTokenIfExpired() {
        if let date =  GIDSignIn.sharedInstance()?.currentUser?.authentication?.accessTokenExpirationDate, date <= Date() {
            GIDSignIn.sharedInstance()?.delegate = nil
            GIDSignIn.sharedInstance()?.restorePreviousSignIn()
          }
    }

}
