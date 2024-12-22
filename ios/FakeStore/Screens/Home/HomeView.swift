//
//  ContentView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 29/07/2024.
//

import SwiftUI

let campaign1 = "https://i.ibb.co/GTmVxSM/DALL-E-2024-12-08-16-24-02-A-modern-and-elegant-promotional-banner-for-Cosmethics-a-luxury-skincare.webp"

let campaign2 = "https://i.ibb.co/ZNHkV7g/DALL-E-2024-12-08-16-25-23-A-modern-and-elegant-promotional-banner-for-Cosmethics-a-luxury-skincare.webp"

let hPadding = 20.0

struct Carousel: View {
    var body: some View{
        VStack(alignment: .leading){
            Text("New arrival")
            HStack {
                AsyncImage(url: URL(string: campaign1)){ image in
                    image
                        .resizable().frame(width: 100, height: 100)
                } placeholder: {
                    Color.gray.opacity(0.1).frame(width: 100, height: 100)
                }
                
                AsyncImage(url: URL(string: campaign1)){ image in
                    image
                        .resizable().frame(width: 100, height: 100)
                } placeholder: {
                    Color.gray.opacity(0.1).frame(width: 100, height: 100)
                }
                
                AsyncImage(url: URL(string: campaign1)){ image in
                    image
                        .resizable().frame(width: 100, height: 100)
                } placeholder: {
                    Color.gray.opacity(0.1).frame(width: 100, height: 100)
                }
                
            }
        }
    }
}



struct Header: View {
    var body: some View{
        VStack {
            HStack {
                VStack(alignment: .leading){
                    Text("Welcome 👋")
                    Text("Mary Jane")
                }
                
                Spacer()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                    Image(systemName: "bell")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                }
            }.padding(hPadding)
        }
        
    }
}



struct Deals: View {
    var body: some View{
        AsyncImage(url: URL(string: campaign1)){ image in
            image
                .resizable().frame(height: 200)
                .padding(hPadding)
        } placeholder: {
            Color.gray.opacity(0.1).frame(height: 200)
        }
        
        AsyncImage(url: URL(string: campaign2)){ image in
            image
                .resizable().frame(height: 200).padding(hPadding)
        } placeholder: {
            Color.gray.opacity(0.1).frame(height: 200)
        }
    }
}

struct HomeView: View {
    var body: some View {
        ScrollView{
            Header()
            Deals()
            CategoriesView()
            Carousel()
        }
        
    }
}

#Preview {
    HomeView()
}
