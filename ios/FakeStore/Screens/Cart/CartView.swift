//
//  CartView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        HStack{
            RoundedButton(action: {
                
            }) {
                
                Image(systemName: "arrowshape.backward")
                    .imageScale(.medium)
                    .foregroundStyle(.tint)
            }
            Text("Cart").font(.title2).padding(.trailing, vPadding)
            Spacer()
            
        }.padding(.horizontal, hPadding)
        
        
        HStack{
            Card(width: 200,height: 300, content: {
                AsyncImage(url: URL(string: campaign1)){ image in
                    image
                        .resizable().frame(width: 200, height: 200)
                } placeholder: {
                    Color.gray.opacity(0.1).frame(width: 200, height: 200)
                }
                
            })
            
            VStack(alignment: .leading){
                HStack {
                    Text("Name: ")
                    Text("Oh Snap Pencil")
                }
                
                HStack {
                    Text("Price: ")
                    Text("10$")
                }
                
                HStack {
                    Text("Brand: ")
                    Text("Maybeline")
                }
                
            }
        }
        Spacer()
    }
}

#Preview {
    CartView()
}
