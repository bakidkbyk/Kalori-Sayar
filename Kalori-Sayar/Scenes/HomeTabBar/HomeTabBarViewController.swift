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
        tabBar.barTintColor = .red
        tabBar.unselectedItemTintColor = UIColor.lightGray
        
        let caloriesListViewController = createCaloriesListViewController()
        let bmiViewController = createBMIViewController()
        
        viewControllers = [
            caloriesListViewController,
            bmiViewController
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
    
    private func createBMIViewController() -> UINavigationController {
        let bmiRouter = BMIRouter()
        let bmiViewModel = BMIViewModel(router: bmiRouter)
        let bmiViewController = BMIViewController(viewModel: bmiViewModel)
        let navigationController = UINavigationController(rootViewController: bmiViewController)
        navigationController.tabBarItem.image = .icBmi
        bmiRouter.viewController = bmiViewController
        return navigationController
    }
}
