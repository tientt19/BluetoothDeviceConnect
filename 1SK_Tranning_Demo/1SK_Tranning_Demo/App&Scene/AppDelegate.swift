//
//  AppDelegate.swift
//  1SK_Tranning_Demo
//
//  Created by Valerian on 02/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setInitRootViewController()
        return true
    }
    
    // MARK: ViewController
    func setInitRootViewController() {
        let iOSVersion = ProcessInfo().operatingSystemVersion.majorVersion
        if iOSVersion < 13 { // iOS version < 13.0.0
            // Facebook
            let frame = UIScreen.main.bounds
            let windowSize = CGSize(width: min(frame.width, frame.height), height: max(frame.width, frame.height))
            window = UIWindow(frame: CGRect(origin: .zero, size: windowSize))
            if #available(iOS 13.0, *) {
                window?.overrideUserInterfaceStyle = .light
            } else {
                // Fallback on earlier versions
            }
            let rootController = MainTabBarController()
            window?.rootViewController = rootController
            window?.makeKeyAndVisible()
        }
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

