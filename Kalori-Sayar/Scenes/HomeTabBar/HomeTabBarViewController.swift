//
//  HomeTabBarViewController.swift
//  Kalori-Sayar
//
//  Created by Baki Dikbıyık on 5.06.2024.
//

import UIKit

final class HomeTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .systemPurple
    
        let caloriesListViewController = createCaloriesListViewController()
        
        viewControllers = [
            caloriesListViewController
        ]
    }
    
    private func createCaloriesListViewController() -> UINavigationController {
        let caloriesListRouter = CaloriesListRouter()
        let caloriesListViewModel = CaloriesListViewModel(router: caloriesListRouter)
        let caloriesListViewConmtroller = CaloriesListViewController(viewModel: caloriesListViewModel)
        let navigationController = UINavigationController(rootViewController: caloriesListViewConmtroller)
        navigationController.tabBarItem.image = .icKcal
        caloriesListRouter.viewController = caloriesListViewConmtroller
        return navigationController
    }
    
}
