//
//  Card.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI


struct CartItemView: View {
    var cartItem: CartItem
    @EnvironmentObject var cartState: CartState
    
    var body: some View {
        HStack{
            Card(width: .infinity, height: 220){
                Card(width: 150,height: 150, content: {
                    AsyncImage(url: URL(string: cartItem.product.imageLink!)){ image in
                        image
                            .resizable().frame(width: 150, height: 150)
                    } placeholder: {
                        Color.gray.opacity(0.1).frame(width: 150, height: 150)
                    }
                    
                })
                
                
                Grid (alignment: .leading, horizontalSpacing: vPadding, verticalSpacing: vPadding) {
                    Text(cartItem.product.name)
                    GridRow {
                        Text("Price: ")
                        Text((cartItem.product.price ?? "-") + "$")
                    }
                    
                    GridRow {
                        Text("Brand: ")
                        Text(cartItem.product.brand ?? "Other")
                    }
                    Spacer()
                    HStack{
                        RoundedButton(action: {
                            if(cartItem.quantity > 1)
                            {
                                cartState.updateQuantity(productId: cartItem.product.id, quantity: cartItem.quantity - 1)
                            }
                        }) {
                            Image(systemName: "minus")
                                .imageScale(.medium)
                                .foregroundStyle(cartItem.quantity > 1 ? Color.black : Color.gray)
                        }
                        
                        Text(String(cartItem.quantity))
                        
                        RoundedButton(action: {
                            cartState.updateQuantity(productId: cartItem.product.id, quantity: cartItem.quantity + 1)
                        }) {
                            
                            Image(systemName: "plus")
                                .imageScale(.medium)
                                .foregroundStyle(.tint)
                        }
                        
                        Spacer()
                        
                        RoundedButton(action: {
                            cartState.removeFromCart(productId: cartItem.product.id)
                        }) {
                            Image(systemName: "trash")
                                .imageScale(.medium)
                                .foregroundStyle(.tint)
                        }.padding(.trailing, 10)
                    }
                }.padding(.vertical, vPadding)
            }
        }
    }
}


#Preview {
    HStack{
        CartItemView(cartItem: CartItem(product: productMock, quantity: 1)).environmentObject(CartState())
    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.gray)
}

