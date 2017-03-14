//
//  File.swift
//  HackerBooksLite
//
//  Created by Eugenio Barquín on 14/3/17.
//  Copyright © 2017 KeepCoding. All rights reserved.
//

import Foundation

public class GetBooksInteractor {
    
    func execute(completion: @escaping ([Book]) -> Void) {
        self.execute(completion: completion, onError: nil)
    
    }
    
    func execute(completion: @escaping ([Book]) -> Void, onError: ErrorClosure? = nil) {
        GetBooksFromJSONFileManager().getBooksFromJSONFile(jsonURL: "books_readbale", completion: { (books: [Book] ) in
            assert(Thread.current == Thread.main)
            completion(books)
        }) { (error: Error) in
        assert(Thread.current == Thread.main)
            if let errorClosure = onError {
                errorClosure(error)
            }
        }
    }
}

