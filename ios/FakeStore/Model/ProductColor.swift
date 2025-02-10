//
//  ProductColor.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/21/25.
//

import Foundation

struct ProductColor: Codable {
    let hexValue: String
    let colourName: String?

    enum CodingKeys: String, CodingKey {
        case hexValue = "hex_value"
        case colourName = "colour_name"
    }
}
