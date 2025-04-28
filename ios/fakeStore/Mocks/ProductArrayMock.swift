//
//  ProductArrayMock.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 2/9/25.
//

import Foundation


let productArrayMock: [Product] = [
    Product(
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
    ),
    Product(
        id: 102,
        name: "Hydrating Foundation",
        brand: "GlamGlow",
        price: "24.99",
        priceSign: "$",
        currency: "USD",
        imageLink: "https://example.com/images/foundation.png",
        productLink: "https://example.com/product/102",
        websiteLink: "https://example.com",
        description: "A lightweight, hydrating foundation with a dewy finish.",
        rating: 4.7,
        category: "Foundation",
        productType: "makeup",
        tagList: ["hydrating", "lightweight", "natural finish"],
        createdAt: "2025-01-12T09:00:00Z",
        updatedAt: "2025-01-19T11:45:00Z",
        productAPIURL: "https://api.example.com/products/102",
        apiFeaturedImage: "https://example.com/api/images/foundation_featured.png",
        productColors: [
            ProductColor(hexValue: "#F5D6C6", colourName: "Ivory"),
            ProductColor(hexValue: "#E3B799", colourName: "Beige"),
            ProductColor(hexValue: "#C98765", colourName: "Tan")
        ]
    ),
    Product(
        id: 103,
        name: "Waterproof Mascara",
        brand: "LashQueen",
        price: "12.49",
        priceSign: "$",
        currency: "USD",
        imageLink: "https://example.com/images/mascara.png",
        productLink: "https://example.com/product/103",
        websiteLink: "https://example.com",
        description: "A smudge-proof waterproof mascara that lasts all day.",
        rating: 4.3,
        category: "Mascara",
        productType: "makeup",
        tagList: ["waterproof", "long-lasting", "smudge-proof"],
        createdAt: "2025-01-15T16:30:00Z",
        updatedAt: "2025-01-20T08:10:00Z",
        productAPIURL: "https://api.example.com/products/103",
        apiFeaturedImage: "https://example.com/api/images/mascara_featured.png",
        productColors: [
            ProductColor(hexValue: "#000000", colourName: "Black"),
            ProductColor(hexValue: "#4B4B4B", colourName: "Dark Brown")
        ]
    ),
    Product(
        id: 104,
        name: "Shimmer Eyeshadow Palette",
        brand: "GlamShades",
        price: "29.99",
        priceSign: "$",
        currency: "USD",
        imageLink: "https://example.com/images/eyeshadow.png",
        productLink: "https://example.com/product/104",
        websiteLink: "https://example.com",
        description: "A 10-color shimmer eyeshadow palette for a dazzling look.",
        rating: 4.8,
        category: "Eyeshadow",
        productType: "makeup",
        tagList: ["high-pigment", "blendable", "shimmer"],
        createdAt: "2025-01-17T14:00:00Z",
        updatedAt: "2025-01-21T12:00:00Z",
        productAPIURL: "https://api.example.com/products/104",
        apiFeaturedImage: "https://example.com/api/images/eyeshadow_featured.png",
        productColors: [
            ProductColor(hexValue: "#FFD700", colourName: "Gold Shimmer"),
            ProductColor(hexValue: "#A020F0", colourName: "Royal Purple"),
            ProductColor(hexValue: "#8B0000", colourName: "Deep Red")
        ]
    )
]
