//
//  SearchView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    
    var body: some View {
        VStack{
            HStack{
                RoundedButton(action: {
                    
                }) {
                    Image(systemName: "arrowshape.backward")
                        .imageScale(.medium)
                        .foregroundStyle(buttonIconColor)
                }
                SearchInput(
                    text: $text
                )
                Spacer()
                
            }.padding(.horizontal, hPadding)
            Spacer()
        }.background(Color.init(hex:"#d1d1d1" ))
    }
}

#Preview {
    SearchView()
}
