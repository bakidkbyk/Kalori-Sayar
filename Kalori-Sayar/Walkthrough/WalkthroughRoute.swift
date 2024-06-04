//
//  WalkthroughRoute.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 1.06.2024.
//

import UIKit

protocol WalkthroughRoute {
    func placeOnWindowWalkthrough()
}

extension WalkthroughRoute where Self: RouterProtocol {
    
    func presentWalkthrough() {
        let router = WalkthroughRouter()
        let viewModel = WalkthroughViewModel(router: router)
        let viewController = WalkthroughViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navigationController, transition: transition)
    }
}
