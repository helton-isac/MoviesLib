//
//  AppDelegate.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 22/09/20.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window?.tintColor = UIColor(named: "Main")
        
        return true
    }
    
    // MARK: - Core Data Stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MoviesLib")
        container.loadPersistentStores{ (storeDescription, error) in
            if let error = error {
                print(error)
            }
        }
        return container
    }()
    
}

