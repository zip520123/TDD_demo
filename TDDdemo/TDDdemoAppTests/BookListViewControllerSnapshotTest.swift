//
//  TDDdemoAppTests.swift
//  TDDdemoAppTests
//
//  Created by zip520123 on 12/07/2022.
//

import XCTest
import TDDdemo
@testable import TDDdemoApp

class ClassA {
    weak var b: ClassB?
}
class ClassB {
    var a: ClassA?
}
class ClassC {
    weak var c: ClassC?
}

class BookListViewControllerSnapshotTests: XCTestCase {
    
    func test_viewController() {
        let books = BookDecoder.decodeBook(data: data)
        
        let booksViewModel = BooksViewModel(books: books)
        
        let sut = BookListViewController(books: booksViewModel)
        sut.loadViewIfNeeded()
        
        assert(snapshot: sut.snapshot(for: .iPhone8(style: .light)), named: "books_light")
        assert(snapshot: sut.snapshot(for: .iPhone8(style: .dark)), named: "books_dark")
        assert(snapshot: sut.snapshot(for: .iPhone8(style: .dark, contentSize: .accessibilityExtraExtraExtraLarge)), named: "books_dark_ExtraExtraExtraLarge")
    }
    
    
    func test_memoryLeak() {
        let a = ClassA()
        let b = ClassB()
        a.b = b
        b.a = a
        
        trackMemoryLeak(a)
        trackMemoryLeak(b)
        
        let c = ClassC()
        c.c = c
        trackMemoryLeak(c)
    }
    
    func trackMemoryLeak(_ sut: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak sut] in
            XCTAssertNil(sut, "memory leak!" , file: file, line: line)
        }
    }
}

let data =
    """
    { "bookdata" : [
    {
    "bookid":"2",
    "bookName":"The Great Gatsby",
    "bookWriter":"F. Scott Fitzgerald",
    "bookPrice":"Rs. 599",
    "bookRating":"4.1",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1490528560l/4671._SY475_.jpg"
    },
    {
    "bookid":"3",
    "bookName":"Anna Karenina",
    "bookWriter":"Leo Tolstoy",
    "bookPrice":"Rs. 459",
    "bookRating":"4.2",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546091617l/15823480._SX318_.jpg"
    },
    {
    "bookid":"4",
    "bookName":"Madame Bovary",
    "bookWriter":"Gustave Flaubert",
    "bookPrice":"Rs. 995",
    "bookRating":"3.8",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1335676143l/2175.jpg"
    },
    {
    "bookid":"5",
    "bookName":"War and Peace",
    "bookWriter":"Leo Tolstoy",
    "bookPrice":"Rs. 1299",
    "bookRating":"4.5",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1413215930l/656.jpg"
    },
    {
    "bookid":"6",
    "bookName":"Lolita",
    "bookWriter":"Vladimir Nabokov",
    "bookPrice":"Rs. 279",
    "bookRating":"4.4",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1377756377l/7604.jpg"
    },
    {
    "bookid":"7",
    "bookName":"Middlemarch",
    "bookWriter":"George ElioT",
    "bookPrice":"Rs. 1299",
    "bookRating":"4.7",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1568307771l/19089.jpg"
    },
    {
    "bookid":"8",
    "bookName":"The Adventures of Huckleberry Finn",
    "bookWriter":"Mark Twain",
    "bookPrice":"Rs. 2299",
    "bookRating":"4.9",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546096879l/2956.jpg"
    },
    {
    "bookid":"9",
    "bookName":"Moby-Dick",
    "bookWriter":"Herman Melville",
    "bookPrice":"Rs. 799",
    "bookRating":"4.4",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1327940656l/153747.jpg"
    },
    {
    "bookid":"10",
    "bookName":"The Lord of the Rings",
    "bookWriter":"J.R.R Tolkien",
    "bookPrice":"Rs. 299",
    "bookRating":"3.5",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1566425108l/33.jpg"
    },
    {
    "bookid":"11",
    "bookName":"To Kill A Mocking Bird",
    "bookWriter":"Harper Lee",
    "bookPrice":"Rs. 1299",
    "bookRating":"4",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1582303449l/29008550.jpg"
    },
    {
    "bookid":"12",
    "bookName":"1984",
    "bookWriter":"Geoge Orwell",
    "bookPrice":"Rs. 2099",
    "bookRating":"4.8",
    "bookImage":"https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1532714506l/40961427._SX318_.jpg"
    }
    ]
}
""".data(using: .utf8)!
