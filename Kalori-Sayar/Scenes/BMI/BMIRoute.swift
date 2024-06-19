//
//  BMIRoute.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 13.06.2024.
//

protocol BMIRoute {
    func presentBMI()
}

extension BMIRoute where Self: RouterProtocol {
    
    func presentBMI() {
        let router = BMIRouter()
        let viewModel = BMIViewModel(router: router)
        let viewController = BMIViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
