//
//  HomeViewModel.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/21/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var deals: [Deal] = []
    @Published var categories: [Category] = []
    @Published var products: [Product] = []
    
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
