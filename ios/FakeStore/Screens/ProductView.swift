//
//  ProductView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    @EnvironmentObject var cart: CartState
    
    init(product: Product) {
        self.product = product;
    }
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        let isInCart = cart.isInCart(productId: product.id)
        
        NavigationView {
            VStack{
                HStack{
                    RoundedButton(action: {
                        dismiss()
                    }) {
                        
                        Image(systemName: "arrowshape.backward")
                            .imageScale(.medium)
                            .foregroundStyle(buttonIconColor)
                    }
                    Text("Product").font(.title2).padding(.trailing, vPadding)
                    
                    Spacer()
                    
                    HStack{
                        RoundedButton(action: {
                            
                        }) {
                            Image(systemName: "heart")
                                .imageScale(.medium)
                                .foregroundStyle(buttonIconColor)
                        }
                        
                        RoundedButton(action: {
                            
                        }) {
                            Image(systemName: "link")
                                .imageScale(.medium)
                                .foregroundStyle(buttonIconColor)
                        }
                    }
                }
                
                ScrollView{
                    if(product.imageLink != nil){
                        AsyncImage(url: URL(string: product.imageLink!)){ image in
                            image
                                .resizable().frame(height: 200)
                                .padding(.vertical, vPadding)
                        } placeholder: {
                            Color.gray.opacity(0.1).frame(height: 200)
                        }
                    } else {
                        Color.gray.opacity(0.1).frame(height: 200)
                    }
                    
                    
                    HStack(alignment: .top){
                        Text(product.name).font(.title2).bold()
                        Spacer()
                        if(product.price != nil)
                        {
                            Text(product.price!).font(.headline)
                        }
                    }.padding(.top, hPadding)
                    
                    HStack{
                        Image(systemName: "star.fill")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        if(product.rating != nil)
                        {
                            Text(String(product.rating!))
                        }
                        Spacer()
                    }
                    
                    VStack(alignment: .leading){
                        Text(product.name).font(.title3).padding(.top, hPadding)
                        Text(product.description ?? "")
                    }.padding(.vertical, hPadding)
                }
                Spacer()
                RectButton(action: { isInCart ? cart.removeFromCart(productId: product.id) :  cart.addToCart(product: product)}, text: isInCart ? "Remove from cart" : "Add to cart" )
            }.padding(.horizontal,hPadding)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProductView(product: productMock)
}
