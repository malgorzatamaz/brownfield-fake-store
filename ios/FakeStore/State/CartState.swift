//
//  CartState.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 3/19/25.
//

import Foundation


class CartState: ObservableObject {
    @Published var items = [CartItem]()
    
    func getShipping() -> Int{
        return 10
    }
    
    func getTotal() -> Int{
        var total = 0
        items.forEach({ item in
            if let itemPrice = item.product.price {
                if let price = Int(itemPrice){
                    total += price
                }
            }
        })

        
        return total
    }

    func isInCart(productId: Int) -> Bool{
        if items.firstIndex(where: { $0.product.id == productId }) != nil {
            return true
        }
        
        return false
    }

    func addToCart(product: Product){
        items.append(CartItem(product: product, quantity: 1))
    }
    
    func updateQuantity(productId: Int, quantity: Int){
        if let index = items.firstIndex(where: { $0.product.id == productId }) {
            items[index].quantity = quantity
        }
    }
    
    func removeFromCart(productId: Int){
        items.removeAll { $0.product.id == productId }
    }
}
