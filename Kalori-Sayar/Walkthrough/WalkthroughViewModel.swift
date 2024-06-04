//
//  WalkthroughViewModel.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 1.06.2024.
//

import Foundation

protocol WalkthroughViewDataSource {}

protocol WalkthroughViewEventSource {}

protocol WalkthroughViewProtocol: WalkthroughViewDataSource, WalkthroughViewEventSource {}

final class WalkthroughViewModel: BaseViewModel<WalkthroughRouter>, WalkthroughViewProtocol {
    
}
