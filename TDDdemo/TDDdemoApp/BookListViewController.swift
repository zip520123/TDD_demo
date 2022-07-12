import UIKit
import TDDdemo

struct BookViewModel {
    let name: String
    let price: String
}

struct BooksViewModel {
    let books: [BookViewModel]
    
    init(books: [Book]) {
        self.books = books.map { book in
            BookViewModel(name: book.name, price: "$\(book.price)")
        }
    }
}

class BookCell: UITableViewCell {
    var name: String? {
        textLabel?.text
    }
    var price: String? {
        detailTextLabel?.text
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(viewModel: BookViewModel) {
        textLabel?.text = viewModel.name
        detailTextLabel?.text = viewModel.price
    }
}


class BookListViewController: UITableViewController {
    let books: BooksViewModel
    init(books: BooksViewModel) {
        self.books = books
        super.init(style: .plain)
        tableView.register(BookCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookCell
        let viewModel = books.books[indexPath.row]
        cell.set(viewModel: viewModel)
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
