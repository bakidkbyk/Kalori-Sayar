//
//  HomeTabBarRoute.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

protocol HomeTabBarRoute {
    func placeOnWindowTabBar()
}

extension HomeTabBarRoute where Self: RouterProtocol {
    
    func placeOnWindowTabBar() {
        let homeTabBarController = HomeTabBarViewController()
        let transition = PlaceOnWindowTransition()
       
        open(homeTabBarController, transition: transition)
    }
}
