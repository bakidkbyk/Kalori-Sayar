//
//  CaloriesListViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

import Foundation

protocol CaloriesListViewDataSource {}

protocol CaloriesListViewEventSource {}

protocol CaloriesListViewProtocol: CaloriesListViewDataSource, CaloriesListViewEventSource {}

final class CaloriesListViewModel: BaseViewModel<CaloriesListRouter>, CaloriesListViewProtocol {
    
}
