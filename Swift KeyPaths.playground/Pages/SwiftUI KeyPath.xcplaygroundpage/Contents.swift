/*:
 [< Previous](@previous)                    [Home](Introduction)
 ## KeyPaths in SwiftUI
 */
import SwiftUI
import PlaygroundSupport
/*:
 - Callout(Identity):How is the Identity protocol related to KeyPaths
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

struct ContentView: View {
    var body: some View {
        List(products, id: \.name) { product in
            HStack {
                Text(product.name)
                Text(product.retail, format: .currency(code: "USD"))
                Text(product.wholesale, format: .currency(code: "USD"))
            }
            Text("Total Retail: \(Product.total(of: products, for: \.retail), format: .currency(code: "USD"))")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
/*:
 [< Previous](@previous)                    [Home](Introduction)
 */
