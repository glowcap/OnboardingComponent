//
//  AppDelegate.swift
//  OnboardingTest
//
//  Created by daymein on 2017/12/11.
//  Copyright © 2017 daymein. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    let pathVC = PathSelectionViewController()
    let navCon = UINavigationController(rootViewController: pathVC)
    navCon.navigationBar.isHidden = true
    window?.rootViewController = navCon
    
    return true
  }

}
