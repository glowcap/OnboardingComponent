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
    let onboardVC = createOnboardingVC()
    window?.rootViewController = onboardVC
    
    return true
  }
  
  private func createOnboardingVC() -> OnboardingViewController {
    let model1 = OnboardingContentModel(image: #imageLiteral(resourceName: "Onboard01"), text: "Onboarding message one. This message is to welcome the user to the onboarding process. It may take a few lines to do so.")
    let model2 = OnboardingContentModel(image: #imageLiteral(resourceName: "SamplePNG"), text: "Onboarding message two. Here is where users find out some of the benefits of the application.")
    let model3 = OnboardingContentModel(image: #imageLiteral(resourceName: "SamplePDF"), text: "Onboarding message three. The final screen is some kind of push to get the user started with the application.")
    return OnboardingViewController(models: [model1, model2, model3])
  }

}
