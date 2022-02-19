//
//  AppDelegate.swift
//  Rently Application (iOS)
//
//  Created by Archana Venugopal on 19/02/22.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if(window != nil) {
            let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "mapViewController")
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
        }
        
        return true
    }
}
