//
//  BMIWarningUpViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 13.06.2024.
//

import Foundation

protocol BMIWarningUpViewDataSource {}

protocol BMIWarningUpViewEventSource {}

protocol BMIWarningUpViewProtocol: BMIWarningUpViewDataSource, BMIWarningUpViewEventSource {}

final class BMIWarningUpViewModel: BaseViewModel<BMIWarningUpRouter>, BMIWarningUpViewProtocol {
    
    let bmi: Double
    let category: String
    
    init(bmi: Double, category: String, router: BMIWarningUpRouter) {
        self.bmi = bmi
        self.category = category
        super.init(router: router)
    }
    
    func closeRouter() {
        router.close()
    }
}
