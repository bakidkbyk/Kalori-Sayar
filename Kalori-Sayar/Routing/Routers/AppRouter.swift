//
//  AppRouter.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 1.06.2024.
//

import UIKit
import MobilliumUserDefaults

final class AppRouter: Router, AppRouter.Routes {
 
    typealias Routes = WalkthroughRoute & HomeTabBarRoute
    static let shared = AppRouter()
    
    func startApp() {
        
//        if DefaultsKey.isWalkthroughFinished.value == true {
//            placeOnWindowTabBar()
//        } else {
//            placeOnWindowWalkthrough()
//        }
        placeOnWindowWalkthrough()

    }
    
    private func topViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
