//
//  ProductView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        VStack{
            HStack(alignment: .top){
                HStack {
                    
                    RoundedButton(action: {
                       
                    }) {
                        
                    Image(systemName: "arrowshape.backward")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    }
                    
                    Spacer()
                    
                    HStack{
                        RoundedButton(action: {
                           
                        }) {
                            Image(systemName: "heart")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                        }
                        
                        RoundedButton(action: {
                           
                        }) {
                            Image(systemName: "link")
                                .imageScale(.large)
                                .foregroundStyle(.tint)
                        }
                    }
                    
                }
            }
            
            AsyncImage(url: URL(string: campaign1)){ image in
                image
                    .resizable().frame(height: 200)
                    .padding(hPadding)
            } placeholder: {
                Color.gray.opacity(0.1).frame(height: 200)
            }
            Spacer()
        }.background(Color.gray)
    }
}

#Preview {
    ProductView()
}
