
//
//  Button.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct RoundedButton<Content: View>: View {
    let action: () -> Void
    let content: () -> Content
    
    init(
        action: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
    }
    
    var body: some View {
        Button(action: action) {
            content()
        }
        .frame(width: 40, height: 40)
        .background(Color.white)
        .cornerRadius(40)
    }
}

#Preview {
    RoundedButton(action: {
        // Action for "See All"
    }) {
    Image(systemName: "arrowshape.backward")
        .imageScale(.large)
        .foregroundStyle(.tint)
    }
}
