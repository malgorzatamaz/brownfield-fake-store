//
//  Categories.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/20/24.
//

import SwiftUI


struct CategoriesList: View {
    

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: hPadding) {
                HeaderView()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: hPadding) {
                        ForEach(productTypes, id: \.self) { type in
                            CategoryItem(category: type)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Category")
                .font(.headline)
                .foregroundColor(.black)

            Spacer()

            Button(action: {
                // Action for "See All"
            }) {
                Text("See All")
                    .font(.subheadline)
                    .foregroundColor(.orange)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryItem: View {
    let category: String

    var body: some View {
        Card{
            Text(category)
                .font(.caption)
                .foregroundColor(.black)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList()
    }
}
