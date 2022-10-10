//
//  MainTabBarController.swift
//  SoyuzSnab-test-task
//
//  Created by Gleb Glushok on 06.10.2022.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: FavouriteViewContoller())
        
        vc1.tabBarItem.image = UIImage(systemName: "sun.and.horizon")
        vc2.tabBarItem.image = UIImage(systemName: "heart")
        
        vc1.title = "Weather"
        vc2.title = "Saved"
        
        tabBar.tintColor = .label
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemGray5
        
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()
        
        tabBarItemAppearance.selected.titleTextAttributes =  [NSAttributedString.Key.foregroundColor: UIColor.orange]
        tabBarItemAppearance.selected.iconColor = .orange

        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance

        tabBar.standardAppearance = tabBarAppearance
        setViewControllers([vc1, vc2], animated: true)
    }
}
