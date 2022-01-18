//
//  HumidityPresenter.swift
//  Thermostat Display
//  Created by Rohit Pradhan on 13/01/22.
//

import Foundation

protocol HumidityView: class {
    func setAmbientHumidityPercent(humidity: Float)
    func showFailure(error: Error)
}

protocol HumidityPresenter {
    var router: HumidityViewRouter { get }
    func viewDidLoad()
}

class HumidityPresenterImplementation: HumidityPresenter {
    fileprivate weak var view: HumidityView?
    private(set) var router: HumidityViewRouter
    private let useCaseLocator: UseCaseLocator
    private let humidityUseCase: HumidityUseCase?

    init(view: HumidityView,
         router: HumidityViewRouter, useCaseLocator: UseCaseLocator) {
        self.view = view
        self.router = router
        self.useCaseLocator = useCaseLocator
        self.humidityUseCase = self.useCaseLocator.getUseCase(ofType: HumidityUseCase.self)
    }

    func viewDidLoad() {
       getHumidityData()
    }

    private func getHumidityData() {

        let request = HumidityInfo.HumidityInfoRequest(projectId: AppConstants.projectId, deviceId: AppConstants.deviceId)

        humidityUseCase?.getHumidityInfo(parameters: request, completion: { [weak self] (result) in
            switch result {
                case .success(let response):
                    self?.view?.setAmbientHumidityPercent(humidity:  response.ambientHumidityPercent)

                case .failure(let error):
                    self?.view?.showFailure(error: error)
            }
        })

    }

}

