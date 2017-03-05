
import CoreData
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
    
    var window: UIWindow?
    var context: NSManagedObjectContext?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Clean up all local caches
        AsyncData.removeAllLocalFiles()
        
        
        
        let container = persistentContainer(dbName: "BookCoreData") { (error: NSError) in
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        
        self.context = container.viewContext
        injectContextToFirstViewController()

        
        //testZone()
        
        
        //Dsiplay
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        saveContext(context: context)
    }
    /*
    func testZone() {
        let myBook: BookCoreData = BookCoreData(context: self.context!)
        myBook.title = "Book Title"
        
        saveContext(context: context!)
    }*/
 
    func injectContextToFirstViewController() {
        if let navController = window?.rootViewController as? UINavigationController,
            let initialViewController = navController.topViewController as? LibraryViewController
        {
            initialViewController.context = self.context
        }
    }
    
    

}

