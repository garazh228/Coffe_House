//
//  CustonTapBarController.swift
//  Coffe_House
//
//  Created by adyl CEO on 15/04/2024.
//

import UIKit

class CustonTapBarController: UITabBarController {
    
    private let customTabBar = CustomTapBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Меню"
        
        setupTabItems()
        setupCustomTabBar()
        
        navigationItem.hidesBackButton = true
    }
    
    private func  setupTabItems() {
        
        let firstVC = MenuViewController()
        firstVC.tabBarItem.image = UIImage(systemName: "house")
        
        let secondVC = CartViewController()
        secondVC.tabBarItem.image = UIImage(systemName: "bag")
        
        let thirdVC = MenuViewController()
        thirdVC.tabBarItem.image = UIImage(systemName: "safari")
        
        let fourthVC = MenuViewController()
        fourthVC.tabBarItem.image = UIImage(systemName: "person")
        
        setViewControllers([firstVC, secondVC, thirdVC, fourthVC], animated: true)
    }
    
    private func setupCustomTabBar() {
        setValue(customTabBar, forKey: "tabBar")
    }
}
