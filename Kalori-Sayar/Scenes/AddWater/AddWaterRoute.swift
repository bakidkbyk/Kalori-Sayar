//
//  AddWaterRoute.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 25.06.2024.
//

import UIKit

protocol AddWaterRoute {
    func presentAddWater()
}

extension AddWaterRoute where Self: RouterProtocol {
    
    func presentAddWater() {
        let router = AddWaterRouter()
        let viewModel = AddWaterViewModel(router: router)
        let viewController = AddWaterViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        if #available(iOS 13.0, *) {
            transition.modalPresentationStyle = .automatic
        }
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
