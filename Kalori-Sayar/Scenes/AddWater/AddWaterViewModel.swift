//
//  AddWaterViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 25.06.2024.
//

import Foundation

protocol AddWaterViewDataSource {}

protocol AddWaterViewEventSource {}

protocol AddWaterViewProtocol: AddWaterViewDataSource, AddWaterViewEventSource {}

final class AddWaterViewModel: BaseViewModel<AddWaterRouter>, AddWaterViewProtocol {
    
}
