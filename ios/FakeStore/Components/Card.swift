//
//  Card.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI


struct Card<Content: View>: View {
    let content: () -> Content
    let width: CGFloat?
    let height: CGFloat?
    

    init(width: CGFloat? = nil, height: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
            self.width = width
            self.height = height
            self.content = content
        }
    
    var body: some View {
        HStack {
            content().padding(hPadding)
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 5)
    }
}


#Preview {
    HStack{
        Card(){
            Text("text")
        }
        
        Card(width: 100, height: 200){
            
        }
    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.gray)
}
