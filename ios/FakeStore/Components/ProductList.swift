//
//  ProductList.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/15/25.
//

import SwiftUI


struct ProductItem: View {
    let width: CGFloat?
    let product: Product
    
    init(product: Product,width: CGFloat? = nil) {
        self.product = product;
        self.width = width;
    }
    
    var body: some View {
        NavigationLink(destination: ProductView(product: product), label: {
            Card(height: 120){
                VStack{
                    if(product.apiFeaturedImage != nil){
                        AsyncImage(url: URL(string: product.apiFeaturedImage!)){ image in
                            image
                                .resizable().scaledToFit().padding(5)
                        } placeholder: {
                            Color.gray.opacity(0.1)
                        }
                    }
                    else{
                        Color.gray.opacity(0.1)
                    }
                    Spacer()
                    Text(product.name)
                    if(product.price != nil){
                        let price = "\(product.price!) \(product.priceSign ?? "$")"
                        Text(price)
                    }
                }
            }
        }).navigationBarBackButtonHidden(true)
    }
}

let rows = [GridItem(.adaptive(minimum: 100,maximum: 200)), GridItem(.adaptive(minimum: 100,maximum: 200)), GridItem(.adaptive(minimum: 100,maximum: 200))]

struct ProductList: View {
    let products: [Product]
    var body: some View {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible()), count: 3)
                ) {
                    ForEach(products) { product in
                        VStack {
                            ProductItem(product: product)
                        }
                    }
                }
            }
}

#Preview {
    ProductList(products: productArrayMock)
}
