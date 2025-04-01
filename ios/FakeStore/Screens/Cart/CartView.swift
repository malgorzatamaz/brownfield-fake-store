//
//  CartView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct CartView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var cartState: CartState
    
    var body: some View {
        VStack{
            HStack{
                RoundedButton(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrowshape.backward")
                        .imageScale(.medium)
                        .foregroundStyle(buttonIconColor)
                }
                Text("Cart").font(.title2).padding(.trailing, vPadding)
                Spacer()
                
            }.padding(.vertical, vPadding)
            ScrollView{
                VStack(spacing: hPadding) {
                    ForEach(cartState.items) { cartItem in
                        CartItemView(cartItem: cartItem)
                    }
                }
            }
            
            Grid(verticalSpacing: 5){
                HStack{
                    Text("Sub Total")
                    Spacer()
                    Text(String(cartState.getTotal()) + "$")
                }
                HStack{
                    Text("Shipping")
                    Spacer()
                    Text(String(cartState.getShipping()) + "$")
                }
                HStack{
                    Text("Total")
                    Spacer()
                    Text(String(cartState.getTotal() + cartState.getShipping()) + "$")
                }
            }
            
            NavigationLink(destination: CheckoutView()) {
            VStack {
                Text("Checkout").font(.title3).foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, minHeight: 40)
            .background(.blue)
            .cornerRadius(5)
            }
        }.padding(.horizontal, hPadding)
    }
}

#Preview {
    CartView().environmentObject(CartState())
}
