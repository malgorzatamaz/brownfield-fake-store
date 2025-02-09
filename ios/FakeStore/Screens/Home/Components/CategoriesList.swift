//
//  Categories.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/20/24.
//

import SwiftUI


struct CategoriesList: View {
    private let categories = [
        Category(imageURL: "https://example.com/rings.jpg", title: "Rings"),
        Category(imageURL: "https://example.com/necklace.jpg", title: "Necklace"),
        Category(imageURL: "https://example.com/bracelets.jpg", title: "Bracelets"),
        Category(imageURL: "https://example.com/earrings.jpg", title: "Earrings"),
        Category(imageURL: "https://example.com/nose.jpg", title: "Nose")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HeaderView()

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(categories) { category in
                        CategoryItem(category: category)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
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
    let category: Category

    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: category.imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView() // Shows a loading spinner
                        .frame(width: 60, height: 60)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                case .failure:
                    Image(systemName: "photo") // Fallback image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }

            Text(category.title)
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
