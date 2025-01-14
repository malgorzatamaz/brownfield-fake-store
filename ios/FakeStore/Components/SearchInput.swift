//
//  SearchInput.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/7/25.
//

import SwiftUI

struct SearchInput: View {
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("", text: $text, prompt: Text("Search").foregroundStyle(.gray))
                    .font(.body)
            }.frame(height: 40).padding(.horizontal, hPadding)
            .background(
                RoundedRectangle(cornerRadius: 30).fill(.white)
            )
        }
    }
}

struct SearchInput_Previews: PreviewProvider {
    @State static var text = ""

    static var previews: some View {
        SearchInput(
            text: $text
        )
        .previewLayout(.sizeThatFits)
        .padding().background(.gray)
    }
}
