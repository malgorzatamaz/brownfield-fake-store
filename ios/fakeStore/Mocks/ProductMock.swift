//
//  ProductMock.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 2/9/25.
//

import Foundation

let productMock = Product(
    id: 101,
    name: "Matte Lipstick",
    brand: "BeautyBrand",
    price: "15.99",
    priceSign: "$",
    currency: "USD",
    imageLink: "https://example.com/images/lipstick.png",
    productLink: "https://example.com/product/101",
    websiteLink: "https://example.com",
    description: "A long-lasting matte lipstick with rich pigment.",
    rating: 4.5,
    category: "Lipstick",
    productType: "makeup",
    tagList: ["vegan", "cruelty-free", "long-lasting"],
    createdAt: "2025-01-10T14:32:00Z",
    updatedAt: "2025-01-18T10:15:00Z",
    productAPIURL: "https://api.example.com/products/101",
    apiFeaturedImage: "https://example.com/api/images/lipstick_featured.png",
    productColors: [
        ProductColor(hexValue: "#FF5733", colourName: "Coral Red"),
        ProductColor(hexValue: "#C70039", colourName: "Deep Rose")
    ]
)
