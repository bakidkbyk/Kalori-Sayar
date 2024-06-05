//
//  WalkthroughViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 1.06.2024.
//

import Foundation
import UIComponents

protocol WalkthroughViewDataSource {
    func numberOfItemsAt() -> Int
    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol
}

protocol WalkthroughViewEventSource {}

protocol WalkthroughViewProtocol: WalkthroughViewDataSource, WalkthroughViewEventSource {}

final class WalkthroughViewModel: BaseViewModel<WalkthroughRouter>, WalkthroughViewProtocol {
    func numberOfItemsAt() -> Int {
        cellItems.count
    }

    func cellItemAt(indexPath: IndexPath) -> WalkthroughCellProtocol {
        return cellItems[indexPath.row]
    }
    
    private var cellItems: [WalkthroughCellProtocol] = [ WalkthroughCellModel(image: .health1, titleLabel: L10n.Walkthrough.saglikTitle, descriptionLabel: L10n.Walkthrough.saglikli) , WalkthroughCellModel(image: .health2, titleLabel: L10n.Walkthrough.analizTitle, descriptionLabel: L10n.Walkthrough.analiz) , WalkthroughCellModel(image: .health3, titleLabel: L10n.Walkthrough.diyetTitle, descriptionLabel: L10n.Walkthrough.diyet)]
    
    func goToTabbarScreen() {
        router.placeOnWindowTabBar()
    }

}
