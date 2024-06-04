//
//  AppRouter.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 1.06.2024.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
 
    typealias Routes = WalkthroughRoute
    static let shared = AppRouter()
    
    func startApp() {
        placeOnWindowWalkthrough()
    }
}
