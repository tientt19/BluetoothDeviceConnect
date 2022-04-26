//
//  MainTabBarController.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setInitAddItemTabBarController()
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        let navigation = self.selectedViewController as? BaseNavigationController
        return navigation?.supportedInterfaceOrientations ?? .portrait
    }
    
    private func setInitAddItemTabBarController() {
        self.tabBar.layer.borderColor = UIColor(hex: "D4D4D4").cgColor
        self.tabBar.layer.borderWidth = 0.5
        
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        UITabBar.appearance().barTintColor = UIColor.white
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = UIColor(hex: "00C2C5")
        UITabBar.appearance().unselectedItemTintColor = .black
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barStyle = .default
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .selected)
        
        let verticalSize: CGFloat = -1 // -3.0

        
        //HOME
        let homeController = HomeScreenRouter.setupModule()
        
        homeController.tabBarItem.tag = 0
        homeController.tabBarItem.title  = "Home"
        homeController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: verticalSize)
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        homeController.tabBarItem.image = UIImage(named: "home")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        homeController.tabBarItem.selectedImage = UIImage(named: "home")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let homeNavController = BaseNavigationController(rootViewController: homeController)
        homeNavController.setHiddenNavigationBarViewControllers([HomeScreenViewController.self,
                                                                 TrainingDetailViewController.self,
                                                                 DayNhayScreenViewController.self,
                                                                 DayNhayResultScreenViewController.self])

        
        //MESSAGES
        let messagesController = MessagesScreenRouter.setupModule()
        
        messagesController.tabBarItem.tag = 0
        messagesController.tabBarItem.title  = "Tư vấn"
        messagesController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: verticalSize)
        messagesController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        messagesController.tabBarItem.image = UIImage(named: "messages")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        messagesController.tabBarItem.selectedImage = UIImage(named: "messages")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let messageNavController = BaseNavigationController(rootViewController: messagesController)
        messageNavController.setHiddenNavigationBarViewControllers([MessagesScreenViewController.self])
        
        
        //STORE
        let storeController = StoreScreenRouter.setupModule()
        
        storeController.tabBarItem.tag = 0
        storeController.tabBarItem.title  = "Của hàng"
        storeController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: verticalSize)
        storeController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        storeController.tabBarItem.image = UIImage(named: "store")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        storeController.tabBarItem.selectedImage = UIImage(named: "store")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let storeNavController = BaseNavigationController(rootViewController: storeController)
        storeNavController.setHiddenNavigationBarViewControllers([])
        
        //TRAINING
        let trainingController = TrainingScreenRouter.setupModule()
        
        trainingController.tabBarItem.tag = 0
        trainingController.tabBarItem.title  = "Tập luyện"
        trainingController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: verticalSize)
        trainingController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        trainingController.tabBarItem.image = UIImage(named: "training")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        trainingController.tabBarItem.selectedImage = UIImage(named: "training")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let trainingNavController = BaseNavigationController(rootViewController: trainingController)
        trainingNavController.setHiddenNavigationBarViewControllers([TrainingDetailViewController.self])
        
        
        //PROFILE
        let profileController = ProfileScreenRouter.setupModule()
        
        profileController.tabBarItem.tag = 0
        profileController.tabBarItem.title  = "Cá nhân"
        profileController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: verticalSize)
        profileController.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        profileController.tabBarItem.image = UIImage(named: "user")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        profileController.tabBarItem.selectedImage = UIImage(named: "user")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        let profileNavController = BaseNavigationController(rootViewController: profileController)
        profileNavController.setHiddenNavigationBarViewControllers([])
        
        // MARK:  Add Tabbar
        self.viewControllers = [
            homeNavController,
            messageNavController,
            storeNavController,
            trainingNavController,
            profileNavController
        ]
    }
}
