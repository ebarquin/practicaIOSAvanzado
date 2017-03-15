//
//  AppDelegate.swift
//  HackerBooksLite
//
//  Created by Fernando Rodríguez Romero on 7/12/16.
//  Copyright © 2016 KeepCoding. All rights reserved.
//

import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    
    var window: UIWindow?
    var model : Library?
    var context: NSManagedObjectContext?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Clean up all local caches
        AsyncData.removeAllLocalFiles()
        
        // Create the window
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        // Create the model
        let booksInteractor = GetBooksInteractor()
        
        
        
        booksInteractor.execute { (books:[Book]) in
            self.model = Library(books: books)
            
        }

        
        let container = persistentContainer(dbName: "BookCoreData") { (error: NSError) in
            fatalError("Unresolved Error \(error) \(error.userInfo)")
        }
        
        self.context = container.viewContext
        
        // Create the rootVC
        let rootVC = LibraryViewController(model: model!, style: .plain)
        window?.rootViewController = rootVC.wrappedInNavigationController()
        
        // Display
        window?.makeKeyAndVisible()
        
        return true
    }
}
