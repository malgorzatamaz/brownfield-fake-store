//
//  Navigation.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/11/25.
//

import SwiftUI

enum NavigationDestinations: String, CaseIterable, Hashable {
    case Home
    case Whishlist
    case Cart
    case Search
}

func getIcon(screen: String) -> String {
    switch screen {
    case "Home":
       return "house"
    case "Whishlist":
        return "heart"
    case "Cart":
        return "cart"
    case "Search":
        return "magnifyingglass"
    default:
        return "polishzlotysign.circle.fill"
    }
}

struct TabItem: View {
    var screen = NavigationDestinations.Home
    var selected = false
    
    init(
        screen: NavigationDestinations = NavigationDestinations.Home,
        selected: Bool = false
    ) {
        self.screen = screen
        self.selected = selected
    }
    
    var body: some View {
        NavigationLink(value: screen) {
            Spacer()
            VStack{
                Image(systemName: getIcon(screen: screen.rawValue))
                    .foregroundColor(selected ? .black : .gray)
                Text(screen.rawValue).foregroundStyle(selected ? .black : .gray)
                
            }
            Spacer()
        }.disabled(selected == true)
    }
}

struct Navigation<Content: View>: View {
    @State private var navigationPath = []
    @State var selectedScreen = NavigationDestinations.Home
    let content: () -> Content
    let screens = NavigationDestinations.allCases
    
    
    init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    var body: some View {
        NavigationStack {
            content()
            HStack{
                ForEach(screens, id: \.self) { screen in
                    TabItem(screen: screen, selected: selectedScreen == screen)
                }
            }.frame(maxWidth: .infinity).padding(vPadding)
                .navigationDestination(for: NavigationDestinations.self) { screen in
                    switch screen {
                    case .Home:
                        HomeView().navigationBarBackButtonHidden(true)
                    case .Cart:
                        CartView().navigationBarBackButtonHidden(true)
                    case .Whishlist:
                        WhishlistView().navigationBarBackButtonHidden(true)
                    case .Search:
                        SearchView().navigationBarBackButtonHidden(true)
                    }
                }
        }
    }
}

#Preview {
    Navigation{

    }
}
