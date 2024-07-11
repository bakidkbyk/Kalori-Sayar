//
//  WaterReminderViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 20.06.2024.
//

import Foundation

protocol WaterReminderViewDataSource {}

protocol WaterReminderViewEventSource {}

protocol WaterReminderViewProtocol: WaterReminderViewDataSource, WaterReminderViewEventSource {}

final class WaterReminderViewModel: BaseViewModel<WaterReminderRouter>, WaterReminderViewProtocol {
    
    func goToAddWaterScreen() {
        router.presentAddWater()
    }
}
