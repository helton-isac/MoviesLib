//
//  AppDelegate.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 22/09/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.tintColor = UIColor(named: "Main")
        
        return true
    }
}

