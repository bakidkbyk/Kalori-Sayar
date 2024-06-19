//
//  BMIViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 7.06.2024.
//

import Foundation

protocol BMIViewDataSource {}

protocol BMIViewEventSource {}

protocol BMIViewProtocol: BMIViewDataSource, BMIViewEventSource {}

final class BMIViewModel: BaseViewModel<BMIRouter>, BMIViewProtocol {
    
     func goToBMIWarningUp(bmi: Double, Category: String) {
        router.presentBMIWarningUp(bmi: bmi, Category: Category)
    }
    
}
