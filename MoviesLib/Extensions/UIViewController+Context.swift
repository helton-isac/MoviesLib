//
//  UIViewController+Context.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 26/09/20.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
}
