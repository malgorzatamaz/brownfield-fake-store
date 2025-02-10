//
//  HomeViewModel.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/21/25.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    @Published var product: Product? = nil
    
    private let dataService = ProductDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
//        dataService.$allProducts.sink { [weak self] (returnedProducts) in
//            self?.product = returnedProducts
//        }
//        .store(in: &cancellables)
    }
}
