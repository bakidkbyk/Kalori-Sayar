//
//  CaloriesListViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

import Foundation
import UIComponents

protocol CaloriesListViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(indexPath: IndexPath) -> CaloriesCellProtocol
}

protocol CaloriesListViewEventSource {}

protocol CaloriesListViewProtocol: CaloriesListViewDataSource, CaloriesListViewEventSource {}

final class CaloriesListViewModel: BaseViewModel<CaloriesListRouter>, CaloriesListViewProtocol {
    
    func numberOfItemsAt() -> Int {
        cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> CaloriesCellProtocol {
        return cellItems[indexPath.row]
    }
    
    let cellItems: [CaloriesCellProtocol] = []
    
}
