//
//  APIResponse.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//


import Foundation

// All entities that model the API responses can implement this so we can handle all responses in a generic way
protocol InitializableWithData {
    init(data: Data?) throws
}

// Optionally, if you use JSON you can implement InitializableWithJson protocol
protocol InitializableWithJson {
    init(json: [String: Any]) throws
}

// Can be thrown when we can't even reach the API
struct NetworkRequestError: Error {
    let error: Error?

    var localizedDescription: String {
        return "Oops something went wrong."
    }
}

// This wraps a successful API response and it includes the generic data as well
// The reason why we need this wrapper is that we want to pass to the client the status code and the raw response as well
struct ApiResponse<T: InitializableWithData> {
    let entity: T
    let data: Data?

    init(data: Data?) throws {
        do {
            self.entity = try T(data: data)
            self.data = data
        } catch {
            throw ApiError.parsingFailed
        }
    }
}

extension Array: InitializableWithData {
    init(data: Data?) throws {
        guard let data = data,
            let jsonObject = try? JSONSerialization.jsonObject(with: data),
            let jsonArray = jsonObject as? [[String: Any]] else {
                throw ApiError.parsingFailed
        }

        guard let element = Element.self as? InitializableWithJson.Type else {
            throw ApiError.parsingFailed
        }

        self = try jsonArray.compactMap({
            return try (element.init(json: $0) as? Element )
        })
    }
}
