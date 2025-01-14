//
//  CheckoutView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct CheckoutView: View {
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RoundedButton(action: {
                    
                }) {
                    Image(systemName: "arrowshape.backward")
                        .imageScale(.medium)
                        .foregroundStyle(buttonIconColor)
                }
                Text("Checkout").font(.title2).padding(.trailing, vPadding)
                Spacer()
                
            }.padding(.vertical, vPadding)
            
            ScrollView{
                VStack(alignment: .leading){
                    Text("Delivery Address").font(.title3)
                    
                    
                    TextInput(
                        label: "City",
                        placeholder: "Los Angeles",
                        text: $text
                    )
                    
                    TextInput(
                        label: "Street",
                        placeholder: "5th Avenue 123",
                        text: $text
                    )
                    
                    TextInput(
                        label: "Country",
                        placeholder: "United States",
                        text: $text
                    )
                    
                    
                    Divider().padding()
                    
                    Text("Personal information").font(.title3)
                    
                    TextInput(
                        label: "Name",
                        placeholder: "John doe",
                        icon: "person",
                        text: $text
                    )
                    
                    TextInput(
                        label: "Email",
                        placeholder: "example@example.com",
                        icon: "envelope",
                        text: $text
                    )
                    
                    TextInput(
                        label: "Phone",
                        placeholder: "123 345 678",
                        icon: "phone",
                        text: $text
                    )
                    
                    Divider().padding()
                    
                    Text("Payment").font(.title3)
                    
                    TextInput(
                        label: "Cardholder's Name:",
                        placeholder: "John doe",
                        text: $text
                    )
                    
                    TextInput(
                        label: "Card Number",
                        placeholder: "1234 5678 9012 3456",
                        text: $text
                    )
                    
                    HStack{
                        TextInput(
                            label: "Expiration Date",
                            placeholder: "03/25",
                            text: $text
                        )
                        
                        TextInput(
                            label: "CVV/CVC",
                            placeholder: "123",
                            text: $text
                        )
                        
                    }
                }
                
                Spacer()
                
            }
            RectButton(action: {}, text: "Order")
        }.padding(.horizontal, hPadding);
    }
}

#Preview {
    CheckoutView()
}
