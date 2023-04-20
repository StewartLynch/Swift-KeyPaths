/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
 ## @dynamicMemberLookup
 - Callout(@dyNamicMemberLookup):A feature in Swift that allows you to access members of a type dynamically at runtime using a subscript syntax.
 ---
 */
import Foundation

struct Variety {
    let classification: String
    let type: WineType
    
    enum WineType: String {
        case red, white
    }
}

struct Winery {
    var name: String
    var country: String
}

@dynamicMemberLookup
struct Purchase {
    let winery: Winery
    let variety: Variety
    let qty: Int
    subscript(dynamicMember keyPath: KeyPath<Winery, String>) -> String {
        winery[keyPath: keyPath]
    }
    subscript<T>(dynamicMember keyPath: KeyPath<Variety, T>) -> T {
        variety[keyPath: keyPath]
    }
    static let wineryNameKeyPath = \Self.winery.name
}

let samplePurchase = Purchase(winery: Winery(name: "Road 13", country: "Canada"), variety: Variety(classification: "Chardonnay", type: .white), qty: 3)

code(for: "1. No KeyPaths") {
    // Print the name of the winery of the wine purchased
    print(samplePurchase.winery.name)
    
}

code(for: "2. With KeyPaths") {
    // Print the name of the winery of the wine purchased
    let wineryNameKeyPath = \Purchase.winery.name
//    print(samplePurchase[keyPath: wineryNameKeyPath])
    print(samplePurchase[keyPath: \.winery.name])
}

code(for: "3. Static Type KeyPath") {
    // Create a static Purchase KeyPath to use to print the variety classification
    print(samplePurchase[keyPath: Purchase.wineryNameKeyPath])
}


code(for: "4. Dynamic Member Lookup 1") {
    // Use DynamicMemberLookups to print the sample purchase's winery's name and country
    print(samplePurchase.name)
    print(samplePurchase.country)
}

code(for: "5. Generic Dynamic Member Lookup") {
    // Use a generic DynamicMemberLookup to print the sample purchase's variety calssification and the type's raw value
    print(samplePurchase.classification)
    print(samplePurchase.type.rawValue)
}
/*:
 [< Previous](@previous)                    [Home](Introduction)                    [Next >](@next)
*/
