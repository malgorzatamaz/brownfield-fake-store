//
//  SearchInput.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 1/7/25.
//

import SwiftUI

struct SearchInput: View {
    @Binding var text: String
    @State var showSuggestions = true
    var suggestions: [String]
    var action: (String) -> Void
    
    var filteredOptions: [String] {
          if text.isEmpty {
              return []
          } else {
              return suggestions.filter { $0.lowercased().contains(text.lowercased()) }
          }
      }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("", text: $text, prompt: Text("Search").foregroundStyle(.gray))
                        .font(.body).onKeyPress { _ in
                            showSuggestions = true
                            return .ignored
                        }
                }.frame(height: 40).padding(.horizontal, hPadding)
                    .background(
                        RoundedRectangle(cornerRadius: 30).fill(.white)
                    )
            }
            
            if(showSuggestions){
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(filteredOptions, id: \.self) { option in
                            Text(option)
                                .onTapGesture {
                                    showSuggestions = false
                                    action(option)
                                    text = option
                                }
                            if(option != filteredOptions[filteredOptions.count - 1]){
                                Divider()
                            }
                        }.padding(5)
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: hPadding, style: .continuous)).background(
                        RoundedRectangle(cornerRadius: hPadding, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 5)
                    )
                    
                }
            }
        
        }
    }
}

struct SearchInput_Previews: PreviewProvider {
    @State static var text = ""
    
    func action(str: String) {
        
    }
    
    static var previews: some View {
        SearchInput(
            text: $text,
            suggestions: ["apple", "cherry"],
            action: { str in
            }
        )
        .previewLayout(.sizeThatFits)
        .padding().background(.gray)
    }
}
