//
//  Whishlist.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/14/25.
//

import SwiftUI

struct WhishlistView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack{
            RoundedButton(action: {
                dismiss()
            }) {
                
                Image(systemName: "arrowshape.backward")
                    .imageScale(.medium)
                    .foregroundStyle(buttonIconColor)
            }
            Text("Whishlist").font(.title2).padding(.trailing, vPadding)
            Spacer()
        }.padding(.horizontal, hPadding)
        Spacer()
    }
}

#Preview {
    WhishlistView()
}
