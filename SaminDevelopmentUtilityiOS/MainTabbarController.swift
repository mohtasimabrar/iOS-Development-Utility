//
//  MainTabbarController.swift
//  SaminDevelopmentUtilityiOS
//
//  Created by Mohtasim Abrar Samin on 18/5/22.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let dataViewController = UINavigationController(rootViewController: DataViewController())
        let notificationViewController = UINavigationController(rootViewController: NotificationViewController())
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())
        
        
        let vcs = [homeViewController, dataViewController, notificationViewController, settingsViewController]
        let images = ["home", "bar", "bell", "gear"]
        let colorImages = ["home-color", "bar-color", "bell-color", "gear-color"]
        
        for(index, vc) in vcs.enumerated(){
            vc.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: images[index]), selectedImage: UIImage(named: colorImages[index])?.withRenderingMode(.alwaysOriginal))
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        }
        
        
        self.setViewControllers([homeViewController, dataViewController, notificationViewController, settingsViewController], animated: true)
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(hex: "#fbfdff")
            self.tabBar.standardAppearance = appearance
            self.tabBar.scrollEdgeAppearance = appearance
        }
    }
    
}


//MARK: Tabbar View Controllers
class DataViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        navigationItem.title = "Data"
    }
}

class NotificationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        navigationItem.title = "Notifications"
    }
}

class SettingsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        navigationItem.title = "Settings"
    }
}
