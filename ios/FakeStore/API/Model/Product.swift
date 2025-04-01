//
//  Product.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/19/25.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    let name: String
    let brand, price, priceSign, currency: String?
    let imageLink: String?
    let productLink: String?
    let websiteLink: String?
    let description: String?
    let rating: Float?
    let category: String?
    let productType: String?
    let tagList: [String]
    let createdAt, updatedAt: String?
    let productAPIURL: String?
    let apiFeaturedImage: String?
    let productColors: [ProductColor]?

    enum CodingKeys: String, CodingKey {
        case id, brand, name, price
        case priceSign = "price_sign"
        case currency
        case imageLink = "image_link"
        case productLink = "product_link"
        case websiteLink = "website_link"
        case description, rating, category
        case productType = "product_type"
        case tagList = "tag_list"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case productAPIURL = "product_api_url"
        case apiFeaturedImage = "api_featured_image"
        case productColors = "product_colors"
    }
}

