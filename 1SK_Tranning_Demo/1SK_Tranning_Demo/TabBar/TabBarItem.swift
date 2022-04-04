//
//  TabBarItem.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//

import Foundation
import UIKit

enum TabbarItem {
    case home
    case messages
    case store
    case care
    case me
    
    var item: UITabBarItem {
        switch self {
        case .home:
            let tabBarItem = UITabBarItem(title: "Home",
                                       image: self.tabbarImage(with: UIImage(named: "home")),
                                       selectedImage: self.tabbarImage(with: UIImage(named: "home")))

            return tabBarItem
            
        case .messages:
            let tabBarItem =  UITabBarItem(title: "Tư vấn",
                                image: self.tabbarImage(with: UIImage(named: "messages")),
                                selectedImage: self.tabbarImage(with: UIImage(named: "messages")))

            return tabBarItem
            
        case .store:
            let tabBarItem =  UITabBarItem(title: "Cửa hàng",
                                image: self.tabbarImage(with: UIImage(named: "store")),
                                selectedImage: self.tabbarImage(with: UIImage(named: "store")))

            return tabBarItem
            
        case .care:
            let tabBarItem =  UITabBarItem(title: "Tập luyện",
                                image: self.tabbarImage(with: UIImage(named: "training")),
                                selectedImage: self.tabbarImage(with: UIImage(named: "training")))

            return tabBarItem
            
        case .me:
            let tabBarItem =  UITabBarItem(title: "Cá nhân",
                                image: self.tabbarImage(with: UIImage(named: "user")),
                                selectedImage: self.tabbarImage(with: UIImage(named: "user")))
            return tabBarItem
        }
    }

    private func tabbarImage(with image: UIImage?) -> UIImage? {
        return image?.withRenderingMode(.alwaysOriginal)
    }
}
