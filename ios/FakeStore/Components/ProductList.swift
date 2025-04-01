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
            Card(height: 200){
                VStack(alignment: .leading){
                    if(product.imageLink != nil){
                        AsyncImage(url: URL(string: product.imageLink!)){ image in
                            image
                                .resizable().frame(height: 110).scaledToFit().padding(hPadding)
                        } placeholder: {
                            Color.gray.opacity(0.1).frame(height: 110)
                        }
                    }
                    else{
                        Color.gray.opacity(0.1).frame(height: 110)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        Text(product.name).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/).foregroundColor(titleColor).font(.subheadline)

                        if(product.price != nil){
                            let price = "\(product.price!) \(product.priceSign ?? "$")"
                            Text(price).font(.caption).foregroundColor(subtitleColor)
                        }
                    }
                }
            }
        })
    }
}

let rows = [GridItem(.adaptive(minimum: 100,maximum: 200)), GridItem(.adaptive(minimum: 100,maximum: 200)), GridItem(.adaptive(minimum: 100,maximum: 200))]

struct ProductList: View {
    let products: [Product]
    var body: some View {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(maximum: 300)), count: 2)
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
