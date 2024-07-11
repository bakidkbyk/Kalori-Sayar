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
        let waterReminderController = createWaterReminderController()
        
        viewControllers = [
            caloriesListViewController,
            bmiViewController,
            waterReminderController
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
    
    private func createWaterReminderController() -> UINavigationController {
        let waterReminderRouter = WaterReminderRouter()
        let waterReminderViewModel = WaterReminderViewModel(router: waterReminderRouter)
        let waterReminderViewController = WaterReminderViewController(viewModel: waterReminderViewModel)
        let navigationController = UINavigationController(rootViewController: waterReminderViewController)
        navigationController.tabBarItem.image = .icWater
        waterReminderRouter.viewController = waterReminderViewController
        return navigationController
    }
}
