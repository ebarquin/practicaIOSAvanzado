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
        GetBooksFromJSONFileManager().getBooksFromJSONFile(jsonURL: "books_readbale", completion: { (books: [Book] ) in
            assert(Thread.current == Thread.main)
            completion(books)
        })
        
    }
}

