//
//  ProductDataService.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/29/25.
//

import Foundation
import Combine

class ProductDataService {
    @Published var filteredProducts: [Product] = []
    @Published var filteredProductsLoading: Bool = false;
    
    @Published var allProducts: [Product] = []
    @Published var allProductsLoading: Bool = false;
    
    var productsSubscription: AnyCancellable?
    var filteredProductsSubscription: AnyCancellable?
    
    init() {
        getProducts()
    }
    
    
    func filterProducts(productType: String?, productCategory: String?, productTags: [String]?, brand: String?) -> Void {
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

    

    
    func getProducts() {
        guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json?product_type=foundation") else { return }

//        URLSession.shared.dataTask(with: url) { data, response, error in
//                guard let data = data else { return }
//                do {
//                    // use decoder on Codable protocol struct
//                  
//                    do {
//                        let product = try JSONDecoder().decode([Product].self, from: data)
//                        
//                        print(product as Any)
//                       } catch DecodingError.dataCorrupted(let context) {
//                        print(context)
//                    } catch DecodingError.keyNotFound(let key, let context) {
//                        print("Key '\(key)' not found:", context.debugDescription)
//                        print("codingPath:", context.codingPath)
//                    } catch DecodingError.valueNotFound(let value, let context) {
//                        print("Value '\(value)' not found:", context.debugDescription)
//                        print("codingPath:", context.codingPath)
//                    } catch DecodingError.typeMismatch(let type, let context) {
//                        print("Type '\(type)' mismatch:", context.debugDescription)
//                        print("codingPath:", context.codingPath)
//                    } catch {
//                        print("error: ", error)
//                    }
//                    // assigned to main thread for improved performance
////                    DispatchQueue.main.async {
////                        self = product.name
////                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }.resume()
//        
            self.allProductsLoading = true;
            productsSubscription = NetworkingManager.download(url: url)
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedProducts) in
                self?.allProducts = returnedProducts
                self?.productsSubscription?.cancel()
                self?.allProductsLoading = false;
            })
    }
    
}
