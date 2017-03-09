
import CoreData
import Foundation

extension Book {
    func BookToBookCoreData(context: NSManagedObjectContext) -> BookCoreData {
        let book = BookCoreData(context:context)
        
        //title
        book.title = self.title
        
        //author
        for author in _authors {
            let authorData = AuthorCoreData(context: context)
            authorData.fullName = author
            
            authorData.addToBooks(book)
            book.authors?.adding(authorData)
        }
        
        //tag
        for tag in _tags {
            let tagData = BookTag(context: context)
            tagData.name = String(describing: tag)
            
            tagData.addToBooks(book)
            book.tags?.adding(tagData)
        }
        
        //CoverPhoto
        let coverPhoto = BookCoverPhoto(context: context)
        coverPhoto.book = book
        coverPhoto.remoteURLString = self._image.url.absoluteString
        coverPhoto.data = self._image._data as NSData?
        
        
        
        
        //pdf
        let pdfData = PDFCoreData(context: context)
        pdfData.book = book
        pdfData.urlString = self._pdf.url.absoluteString
        pdfData.data = self._pdf._data as NSData?
        
        return book
    }
    
    func booksData (books: [Book]) -> [BookCoreData] {
        let booksData = [BookCoreData]()
        for book in books {
            
        }
        
        return booksData
    }
    
}
