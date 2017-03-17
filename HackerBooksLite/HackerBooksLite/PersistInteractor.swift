//
//  PersistInteractor.swift
//  HackerBooksLite
//
//  Created by Eugenio Barquín on 16/3/17.
//  Copyright © 2017 KeepCoding. All rights reserved.
//

import Foundation
import CoreData

class PersistBooksInteractor {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func execute(books: [Book], completion: @escaping ([BookCoreData])-> Void) {
        execute(books: books, completion: completion, onError: nil)
    }
    
    //For each book in [Book] we make a bookCoreData
    func execute(books: [Book], completion: @escaping ([BookCoreData]) -> Void, onError: ErrorClosure?) {
        if onError != nil{
            
        }
        var booksCoreData = [BookCoreData]()
        books.forEach {(book: Book) in
            let newBookCoreData = book.BookToBookCoreData(context: self.context)
            booksCoreData.append(newBookCoreData)
            
    }
        saveContext(context: self.context, onSuccess: {
            completion(booksCoreData)
        }, onError: { (error: Error) in
            if let errorClosure = onError {
                errorClosure(error)
            }
            
        })
        
    }

}
