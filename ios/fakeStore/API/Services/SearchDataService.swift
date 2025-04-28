//
//  ProductDataService.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/29/25.
//

import Foundation
import Combine

class SearchDataService {
    @Published var filteredProducts: [Product] = []
    @Published var filteredProductsLoading: Bool = false;
    
    init() {
        filterProducts()
    }

    var filteredProductsSubscription: AnyCancellable?
    
    func filterProducts(productType: String? = nil, productCategory: String? = nil, productTags: [String]? = nil, brand: String? = nil) -> Void {
        var queryItems: [String] = []
        
        if let productType = productType, !productType.isEmpty {
            queryItems.append("product_type=\(productType.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        
        if let productCategory = productCategory, !productCategory.isEmpty {
            queryItems.append("product_category=\(productCategory.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        
        if let productTags = productTags, !productTags.isEmpty {
            let tagsString = productTags.joined(separator: ",")
            queryItems.append("product_tags=\(tagsString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        
        if let brand = brand, !brand.isEmpty {
            queryItems.append("brand=\(brand.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        
        let query = queryItems.joined(separator: "&")
        
        
        guard let url = query != "" ?  URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json?\(query)") : URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json") else { return }
        
        self.filteredProductsLoading = true;
        
        filteredProductsSubscription = NetworkingManager.download(url: url)
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedProducts) in
                self?.filteredProducts = returnedProducts
                self?.filteredProductsSubscription?.cancel()
                
                self?.filteredProductsLoading = false;
            })
    }
}
