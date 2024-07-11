//
//  WaterReminderRoute.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 25.06.2024.
//

protocol WaterReminderRoute {
    func presentWaterReminder()
}

extension WaterReminderRoute where Self: RouterProtocol {
    
    func presentWaterReminder() {
        let router = WaterReminderRouter()
        let viewModel = WaterReminderViewModel(router: router)
        let viewController = WaterReminderViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
