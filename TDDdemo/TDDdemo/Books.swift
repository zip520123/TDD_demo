import Foundation
public struct BookList: Decodable {
    public let books: [DecodableBook]
    
    enum CodingKeys: String, CodingKey {
        case books = "bookdata"
    }
}

public struct DecodableBook: Decodable {
    public let name: String
    public let price: String
    
    enum CodingKeys: String, CodingKey {
        case name = "bookName"
        case price = "bookPrice"
    }
}

public struct Book {
    public let name: String
    public let price: Int
    
    public init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

public extension Book {
    init(decodableBook: DecodableBook) {
        let arr = String(Array(decodableBook.price)[4...])
        let price = Int(arr)!
        self = Book(name: decodableBook.name, price: price)
    }
}

public struct BookDecoder {
    public static func decodeBook(data: Data) -> [Book] {
        let res = try! JSONDecoder().decode(BookList.self, from: data)
        
        return res.books.map { Book(decodableBook: $0) }
    }
}
