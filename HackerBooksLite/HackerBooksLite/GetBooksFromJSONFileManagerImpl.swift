//
//  GetBooksFromJSONFileManager.swift
//  HackerBooksLite
//
//  Created by Eugenio Barquín on 14/3/17.
//  Copyright © 2017 KeepCoding. All rights reserved.
//

import Foundation

class GetBooksFromJSONFileManager {
    
    func getBooksFromJSONFile (jsonURL: String, completion:([Book]) -> Void) {
        self.getBooksFromJSONFile(jsonURL: jsonURL, completion: completion, onError: nil)
        
    }
    
    
    func getBooksFromJSONFile (jsonURL: String, completion:([Book]) -> Void, onError: ErrorClosure? = nil) {
        
        do{
            guard let url = Bundle.main.url(forResource: "books_readable", withExtension: "json") else{
                fatalError("Unable to read json file!")
            }
            
            let data = try Data(contentsOf: url)
            let jsonDicts = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSONArray
            
            let books = try decode(books: jsonDicts)
            
            completion(books)

            
        }catch {
            fatalError("Error while loading model")
            if let errorClosure = onError {
                errorClosure(error)
            }
        }
        
    }
    
}
