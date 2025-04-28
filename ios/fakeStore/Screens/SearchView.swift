//
//  SearchView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var sm: SearchViewModel
    
    var body: some View {
        
        VStack{
            HStack(alignment: .top){
                RoundedButton(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrowshape.backward")
                        .imageScale(.medium)
                        .foregroundStyle(buttonIconColor)
                }
                SearchInput(
                    text: $searchText,
                    suggestions: sm.suggestions
                )
                Spacer()
            }.padding(.horizontal, hPadding)
            ProductList(products: [])
            Spacer()
        }.background(Color.init(hex:"#d1d1d1" ))
    }
}

#Preview {
    SearchView()
}
