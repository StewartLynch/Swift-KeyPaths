/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## Practical Use Cases
 */
import Foundation
/*:
 - Callout(Reduce):Using the reduce higher order function to sum wholesale and retail quantities of an array of products using a KeyPath function
 ---
*/
struct Product {
    let name: String
    let wholesale: Double
    let retail: Double
    
    // Static total function using KeyPaths
    static func total(of products: [Product], for keyPath: KeyPath<Product, Double>) -> Double {
        return products.reduce(0) { partialResult, product in
            partialResult + product[keyPath: keyPath]
        }
    }

}

let products = [
    Product(name: "Laptop", wholesale: 1200.00, retail: 1350.00),
    Product(name: "Smartphone", wholesale: 600.00, retail: 800.00),
    Product(name: "Headphones", wholesale: 90.00, retail: 150.00)
]

code(for: "1. Wholesale Total") {
//    let wholesaleTotal = products.reduce(0) { partialResult, product in
//        partialResult + product[keyPath: \.wholesale]
//    }
    let wholesaleTotal = Product.total(of: products, for: \.wholesale)
    print(wholesaleTotal)
}

code(for: "2. Retail Total") {
    let retailTotal = Product.total(of: products, for: \.retail)
    print(retailTotal)
}
/*:
 - Callout(Reset):Using a generic static function to reset all values in an array
 ---
*/
struct Player {
    let name: String
    var score: Int
    var isPlaying: Bool
    
    // A generic static reset function to reset score to 0 and isPlaying to false for all players in an array
    static func reset<T>(players: inout [Player], keyPath: WritableKeyPath<Player, T>, newValue: T) {
        for index in players.indices {
            players[index][keyPath: keyPath] = newValue
        }
    }

}

var players = [
    Player(name: "Alice", score: 85, isPlaying: true),
    Player(name: "Bob", score: 75, isPlaying: true),
    Player(name: "Charlie", score: 60, isPlaying: true),
    Player(name: "David", score: 45, isPlaying: false)
]

code(for: "Reset scores and is Playing") {
    Player.reset(players: &players, keyPath: \.score, newValue: 0)
    Player.reset(players: &players, keyPath: \.isPlaying, newValue: false)
    for player in players {
        print(player.name, player.score, player.isPlaying)
    }
}
/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
