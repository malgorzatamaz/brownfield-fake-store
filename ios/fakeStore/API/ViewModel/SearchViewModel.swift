//
//  SearchViewModel.swift
//  fakeStore
//
//  Created by Malgorzata Mazurek on 4/12/25.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    @Published var products: [Product] = []
    var suggestions = brands + productTypes + tags
    
    private let dataService = ProductDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$filteredProducts.sink { [weak self] (returnedProducts) in
            self?.products = returnedProducts
        }
        .store(in: &cancellables)
    }
    
    
    func filterProduct(filter: String){
        var productType: String? = nil;
        var productTags: [String]? = nil;
        var productBrand: String? = nil;
        
        if(productTypes.contains(where: { type in
            type == filter
        })){
            productType = filter
        }
        
        if(tags.contains(where: { tag in
            tag == filter
        })){
            productTags?.append(filter)
        }
        
        if(brands.contains(where: { brand in
            brand == filter
        }))
        {
            productBrand = filter
        }
        
        dataService.filterProducts(productType: productType, productTags: productTags, brand: productBrand)
    }
}
