//
//  Card.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI


struct Card<Content: View>: View {
    let content: () -> Content
    let width: CGFloat
    let height: CGFloat
    
    init(
        width: CGFloat = 150,
        height: CGFloat = 200,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.width = width
        self.height = height
        self.content = content
    }
    
    var body: some View {
        HStack {
            content()
        }
        .frame(width: width, height: height)
        .background(Color.white)
        .cornerRadius(20)
    }
}


#Preview {
    HStack{
        Card(){
            
        }
    }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.gray)
}
