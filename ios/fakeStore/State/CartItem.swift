//
//  CartItem.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 3/19/25.
//

import Foundation

struct CartItem: Identifiable {
    var id: Int
    init(product: Product, quantity: Int) {
        self.id = product.id
        self.product = product
        self.quantity = quantity
    }
    var product: Product
    var quantity: Int
}
