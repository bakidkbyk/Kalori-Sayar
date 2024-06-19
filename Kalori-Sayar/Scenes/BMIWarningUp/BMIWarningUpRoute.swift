//
//  BMIWarningUpRoute.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 13.06.2024.
//

protocol BMIWarningUpRoute {
    func presentBMIWarningUp(bmi: Double, Category: String)
}

extension BMIWarningUpRoute where Self: RouterProtocol {
    
    func presentBMIWarningUp(bmi: Double, Category: String) {
        let router = BMIWarningUpRouter()
        let viewModel = BMIWarningUpViewModel(bmi: bmi, category: Category, router: router)
        let viewController = BMIWarningUpViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        if #available(iOS 13.0, *) {
            transition.modalPresentationStyle = .automatic
        }
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
