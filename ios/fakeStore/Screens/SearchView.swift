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
                    suggestions: sm.suggestions,
                    action: { filter in
                           sm.filterProduct(filter: filter)
                       }
                )
                Spacer()
            }.padding(.horizontal, hPadding)
            ScrollView{
                ProductList(products: sm.products)
            }
            Spacer()
        }.background(Color.init(hex:"#d1d1d1" ))
    }
}

#Preview {
    SearchView()
}
