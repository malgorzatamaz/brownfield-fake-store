
//
//  Button.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct RectButton<Content: View>: View {
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
            Text("Text").foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 40)
        .background(.blue)
        .cornerRadius(5)
    }
}

#Preview {
    RectButton(action: {
        // Action for "See All"
    }) {

    }
}
