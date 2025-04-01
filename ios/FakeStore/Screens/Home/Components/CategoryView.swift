//
//  CategoryView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/15/25.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack{
            RoundedButton(action: {
                dismiss()
            }) {
                Text("Whishlist").font(.title2).padding(.trailing, vPadding)
            }
        }.padding(.horizontal, hPadding)
        Spacer()
    }
}

#Preview {
    CategoryView()
}
