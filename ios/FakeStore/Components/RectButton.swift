
//
//  Button.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct RectButton: View {
    let action: () -> Void
    let text: String
    
    init(
        action: @escaping () -> Void,
        text: String
    ) {
        self.action = action
        self.text = text
    }
    
    var body: some View {
        Button(action: action) {
            Text(text).font(.title3).foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 40)
        .background(.blue)
        .cornerRadius(5)
    }
}

#Preview {
    RectButton(action: {
        
    }, text: "Text")
}
