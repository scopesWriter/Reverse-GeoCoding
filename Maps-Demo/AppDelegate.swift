//
//  AppDelegate.swift
//  Maps-Demo
//
//  Created by Bishoy Badie on 11/05/2022.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyCTRsbHjmk4O_acWm-0BY9vMUTgsa51A70")
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC else {
                fatalError("Unable to instantiate an ViewController from the sotryboard")
              }
        self.window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
        
}

