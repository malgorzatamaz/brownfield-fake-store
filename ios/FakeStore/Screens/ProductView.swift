//
//  ProductView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct ProductView: View {
    var title = "Title"
    var price = "$350"
    var rating = "4.5 (23k)"

    var description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    var body: some View {
        VStack{
            HStack{
                RoundedButton(action: {
                    
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
                AsyncImage(url: URL(string: campaign1)){ image in
                    image
                        .resizable().frame(height: 200)
                        .padding(.vertical, vPadding)
                } placeholder: {
                    Color.gray.opacity(0.1).frame(height: 200)
                }
                
                
                HStack(alignment: .top){
                    Text(title).font(.title2).bold()
                    Spacer()
                    Text(price).font(.headline)
                }.padding(.top, hPadding)
                
                HStack{
                    Image(systemName: "star.fill")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text(rating)
                    Spacer()
                }
                
                VStack(alignment: .leading){
                    Text(title).font(.title3).padding(.top, hPadding)
                    Text(description)
                }.padding(.vertical, hPadding)
            }
            Spacer()
            RectButton(action: {}, text: "Add to cart")
            }.padding(.horizontal,hPadding)
        }
    }

#Preview {
    ProductView()
}
