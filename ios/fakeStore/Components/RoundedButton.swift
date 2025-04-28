
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
        ZStack{
            Button(action: action) {
                content()
            }
            .frame(width: 40, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(.gray, lineWidth: 1).fill(.white)
            )
        }
    }
}

#Preview {
    RoundedButton(action: {
        // Action for "See All"
    }) {
        Image(systemName: "arrowshape.backward")
            .imageScale(.medium)
            .foregroundStyle(buttonIconColor)
    }
}
