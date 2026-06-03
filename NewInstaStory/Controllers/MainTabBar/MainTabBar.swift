//
//  MainTabBar.swift
//  NewInstaStory
//
//  Created by Baziq Hameed on 10/02/2026.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
        
        print("this ran")
    }

    private func configureTabs() {
        
        viewControllers = viewControllers?.map { vc in
            if let nav = vc as? UINavigationController,
               let root = nav.viewControllers.first,
               root.restorationIdentifier == "ExploreNewVC" {
                print("exists")
            let exploreVC = UIStoryboard(name: "Explore", bundle: nil)
                .instantiateViewController(withIdentifier: "ExploreVC")
            exploreVC.tabBarItem = vc.tabBarItem
            return exploreVC
            }
        return vc
        }
        
    }
}

 


