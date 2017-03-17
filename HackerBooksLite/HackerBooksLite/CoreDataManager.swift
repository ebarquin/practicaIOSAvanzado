import Foundation
import CoreData



    
public func persistentContainer(dbName: String, onError: ((NSError) -> Void)? = nil) -> NSPersistentContainer {
    let container = NSPersistentContainer(name: dbName)
        
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        if let error = error as NSError?,
            let onError = onError {
            //fatalError("Unresolved error \(error), \(error.userInfo)")
            onError(error)
        
        }
    })
    return container
}
    

    
public  func saveContext(context: NSManagedObjectContext, onError: ErrorClosure? = nil) {
    if context.hasChanges {
        do {
            try context.save()
        } catch {
            if let errorClosure = onError {
                errorClosure(error)
            }
            
        }
    }
}

public func saveContext(context: NSManagedObjectContext, onSuccess: (() -> Void), onError: ErrorClosure? = nil) {
    if context.hasChanges {
        do {
            try context.save()
            onSuccess()
        } catch {
            if let errorClosure = onError {
                errorClosure(error)
            }

        }
    }
}


