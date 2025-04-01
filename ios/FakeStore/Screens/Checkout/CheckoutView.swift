//
//  CheckoutView.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 12/22/24.
//

import SwiftUI

struct CheckoutView: View {
    @Environment(\.dismiss) var dismiss
    @State private var city: String = ""
    @State private var street: String = ""
    @State private var country: String = ""
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    
    
    @State private var holdersName: String = ""
    @State private var cardNumber: String = ""
    @State private var expirationDate: String = ""
    @State private var CVC: String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    RoundedButton(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrowshape.backward")
                            .imageScale(.medium)
                            .foregroundStyle(buttonIconColor)
                    }
                    Text("Checkout").font(.title2).padding(.trailing, vPadding)
                    Spacer()
                    
                }.padding(.horizontal, hPadding)
                
                Form {
                    VStack(alignment: .leading){
                            Text("Delivery Address").font(.title3)
                            
                            TextInput(
                                label: "City",
                                placeholder: "Los Angeles",
                                text: $city
                            )
                            
                            TextInput(
                                label: "Street",
                                placeholder: "5th Avenue 123",
                                text: $street
                            )
                            
                            TextInput(
                                label: "Country",
                                placeholder: "United States",
                                text: $country
                            )
                            
                            
                            Divider().padding()
                            
                            Text("Personal information").font(.title3)
                            
                            TextInput(
                                label: "Name",
                                placeholder: "John doe",
                                icon: "person",
                                text: $name
                            )
                            
                            TextInput(
                                label: "Email",
                                placeholder: "example@example.com",
                                icon: "envelope",
                                text: $email
                            )
                            
                            TextInput(
                                label: "Phone",
                                placeholder: "123 345 678",
                                icon: "phone",
                                text: $phone
                            )
                            
                            Divider().padding()
                            
                            Text("Payment").font(.title3)
                            
                            TextInput(
                                label: "Cardholder's Name:",
                                placeholder: "John doe",
                                text: $holdersName
                            )
                            
                            TextInput(
                                label: "Card Number",
                                placeholder: "1234 5678 9012 3456",
                                text: $cardNumber
                            )
                            
                            HStack{
                                TextInput(
                                    label: "Expiration Date",
                                    placeholder: "03/25",
                                    text: $expirationDate
                                )
                                
                                TextInput(
                                    label: "CVV/CVC",
                                    placeholder: "123",
                                    text: $CVC
                                )
                            }
                    }
                    .listRowInsets(EdgeInsets())
                    
                }.scrollContentBackground(.hidden)
                
                RectButton(action: {}, text: "Order").padding(.horizontal, hPadding)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CheckoutView()
}
