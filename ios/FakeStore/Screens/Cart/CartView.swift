//
//  CartView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        VStack{
            HStack{
                RoundedButton(action: {
                    
                }) {
                    Image(systemName: "arrowshape.backward")
                        .imageScale(.medium)
                        .foregroundStyle(buttonIconColor)
                }
                Text("Cart").font(.title2).padding(.trailing, vPadding)
                Spacer()
                
            }.padding(.vertical, vPadding)
            ScrollView{
                CartItem()
                CartItem()
                CartItem()
                CartItem()
                CartItem()
                CartItem()
            }
            
            Grid(verticalSpacing: 5){
                HStack{
                    Text("Sub Total")
                    Spacer()
                    Text("650$")
                }
                HStack{
                    Text("Shipping")
                    Spacer()
                    Text("10$")
                }
                HStack{
                    Text("Total")
                    Spacer()
                    Text("660$")
                }
            }
            
            RectButton(action: {
                
            }, text: "Checkout")
        }.padding(.horizontal, hPadding)
    }
}

#Preview {
    CartView()
}
