//
//  APIClient.swift
//  Thermostat Display
//
//  Created by Rohit Pradhan on 12/01/22.
//

import Foundation

protocol ApiRequest {
    var urlRequest: URLRequest { get }
}

protocol ApiClient {
    func execute<T>(request: ApiRequest, completionHandler: @escaping (_ result: Result<ApiResponse<T>>) -> Void)
}

class ApiClientImplementation: ApiClient {

    // MARK: - ApiClient
    func execute<T>(request: ApiRequest, completionHandler: @escaping (Result<ApiResponse<T>>) -> Void) {
        TokenManager.shared.refreshTokenIfExpired()

        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        let task = session.dataTask(with: request.urlRequest) { (data, response, error) in

            DispatchQueue.main.async {
                guard error == nil else {
                      completionHandler(.failure(.internalServerError))
                      return
                }

                guard let content = data else {
                    completionHandler(.failure(.notFound))
                    return
                }

                do {
                    let dataResponse = try ApiResponse<T>(data: content)
                    completionHandler(.success(dataResponse))
                } catch {
                    completionHandler(.failure(.parsingFailed))
                }
            }

        }

        task.resume()
    }

}
