//
//  Result.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

enum ApiError: Error {
    case notFound               //Status code 404
    case internalServerError    //Status code 500
    case parsingFailed
    case loginFailed
}

enum Result<T> {
    case success(T)
    case failure(ApiError)

    func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}
