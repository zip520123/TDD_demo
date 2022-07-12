//
//  TDDdemoAppTests.swift
//  TDDdemoAppTests
//
//  Created by zip520123 on 12/07/2022.
//

import XCTest
import TDDdemo
@testable import TDDdemoApp


class TDDdemoAppTests: XCTestCase {

    func test_viewController() {
        let booksViewModel = BooksViewModel(books:[Book(name: "The Great Gatsby", price: 599), Book(name: "Anna Karenina", price: 459)])
        let sut = BookListViewController(books: booksViewModel)
        sut.loadViewIfNeeded()
        let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! BookCell
        
        XCTAssertEqual(cell.name, "The Great Gatsby")
        XCTAssertEqual(cell.price, "$599")
        
        let cell1 = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! BookCell
        
        XCTAssertEqual(cell1.name, "Anna Karenina")
        XCTAssertEqual(cell1.price, "$459")
        
    }

}
