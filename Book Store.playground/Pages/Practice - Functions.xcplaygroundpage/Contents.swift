/*:

 # Your shopping cart

 Now, it's your turn to create your shopping list.
 
 Assume that you want to buy following books:

 * "Digital Fortress" by "Dan Brown", $9.99
 * "Angels & Demons" by "Dan Brown", $17.00
 * "The Da Vinci Code" by "Dan Brown", $9.99
 * "Deception Point" by "Dan Brown", $17.00
 * "Harry Potter and the Goblet of Fire" by "J.K. Rowling", $12.99
 * "Harry Potter and the Half-Blood Prince" by "J.K. Rowling", $12.99
 * "Harry Potter and the Deathly Hallows" by "J.K. Rowling", $14.99
 * "旅行與讀書" by "詹宏志", $12.00
 * "國宴與家宴" by "王宣一", $7.99

 Then, let's create a book store first:
 
 */
let bookArray: [[String: String]] = [
    ["title": "Digital Fortress","author": "Dan Brown","price": "9.99"],
    ["title": "Angels & Demons","author": "Dan Brown", "price": "17.00"],
    ["title": "The Da Vinci Code","author": "Dan Brown","price": "9.99"],
    ["title": "Deception Point","author": "Dan Brown", "price": "17.00"],
    ["title": "Harry Potter and the Goblet of Fire","author": "J.K. Rowling", "price": "12.99"],
    ["title": "Harry Potter and the Half-Blood Prince","author": "J.K. Rowling", "price": "12.99"],
    ["title": "Harry Potter and the Deathly Hallows", "author": "J.K. Rowling","price": "14.99"],
    ["title": "旅行與讀書","author":"詹宏志","price":"12.00"],
    ["title":"國宴與家宴","author":"王宣一","price":"7.99"]
]
var bookStore = BookStore.from(bookArray)






/*:
 
 Now start to feed data to the book store.
 
 You have to prepare following functions:
 1. A function which returns the name of authors in a set or a list. 
    _Note, you have to remove duplicated authors._
 2. A function which returns the totoal price of books to purchase
 3. A function which returns the number of books to buy
 4. A function which returns a book with its title, author, and price by a given index.
    If the index is out of bound, return `nil`.
 
 */
//先把資料放進變數中
// Use this
func distinctAuthors() -> Set<String> {
    var authors:Set<String>=[];
    for book in bookArray{
        authors.insert(book["author"]!)
    }
    return authors
}
// or this
//func distinctAuthors() -> [String] { ... }
// then
bookStore.setDataSource(authorsGetter: distinctAuthors)

func totalBookPrice() -> Double {
    var total = 0.0;
    for book in bookArray{
        total = total + Double(book["price"]!)!
    }
    return total
}

bookStore.setDataSource(priceCalculator: totalBookPrice)
//可能會問超過書的數量
func getBook(at index: Int) -> (title: String, author: String, price: Double)? {
    
    var p=0.0
    var t="",a=""
    let authors:Set<String>= distinctAuthors()
    guard index < bookArray.count else{
        return nil
    }
    guard index >= 0 else {
        return nil
    }
    for item in bookArray[index].values{
        //item
        
        if authors.contains(item) {
            a.append(item)
        }
        else if (Double(item) != nil){
            
            p = Double(item)!
            
        }
        else{
            t.append(item)
        }
        
        
    }
    return (title: t,author: a,price: p)
}

//getBook(at: 4)

bookStore.setDataSource(bookGetter: getBook(at:))


/*:

 Finally, let's show the book store shopping cart:

 */

bookStore.showInPlayground()

//: ---
//: [<- Previous](@previous) | [Next ->](@next)
