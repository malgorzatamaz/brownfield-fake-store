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
        dataService.$allProducts.sink { [weak self] (returnedProducts) in
            self?.products = returnedProducts
        }
        .store(in: &cancellables)
    }
}
