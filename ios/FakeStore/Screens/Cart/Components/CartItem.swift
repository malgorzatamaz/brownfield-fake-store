//
//  Card.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI


struct CartItem: View {
//    struct CartItem<Content: View>: View {
//    let content: () -> Content
//    let width: CGFloat
//    let height: CGFloat
//    
//    init(
//        width: CGFloat = 150,
//        height: CGFloat = 200,
//        @ViewBuilder content: @escaping () -> Content
//    ) {
//        self.width = width
//        self.height = height
//        self.content = content
//    }
    
    var body: some View {
        HStack{
            Card(width: .infinity, height: 220){
                Card(width: 200,height: 200, content: {
                    AsyncImage(url: URL(string: campaign1)){ image in
                        image
                            .resizable().frame(width: 200, height: 200)
                    } placeholder: {
                        Color.gray.opacity(0.1).frame(width: 200, height: 200)
                    }
                    
                }).padding(.horizontal, 10)
                
                
                Grid (alignment: .leading, horizontalSpacing: hPadding, verticalSpacing: vPadding) {
                    Text("Oh Snap Pencil")
                    GridRow {
                        Text("Price: ")
                        Text("10$")
                    }
                    
                    GridRow {
                        Text("Brand: ")
                        Text("Maybeline")
                    }
                    Spacer()
                    HStack{
                        RoundedButton(action: {
                            
                        }) {
                            Image(systemName: "minus")
                                .imageScale(.medium)
                                .foregroundStyle(.tint)
                        }
                        
                        Text("1")
                        
                        RoundedButton(action: {
                            
                        }) {
                            
                            Image(systemName: "plus")
                                .imageScale(.medium)
                                .foregroundStyle(.tint)
                        }
                        
                        Spacer()
                        
                        RoundedButton(action: {
                            
                        }) {
                            Image(systemName: "trash")
                                .imageScale(.medium)
                                .foregroundStyle(.tint)
                        }.padding(.trailing, 10)
                    }
                }.padding(.vertical, 15)
            }
        }
    }
}


#Preview {
    HStack{
        CartItem()
    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.gray)
}

