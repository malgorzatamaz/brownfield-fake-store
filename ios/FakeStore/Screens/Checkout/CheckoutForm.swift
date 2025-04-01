//
//  FormValidator.swift
//  FakeStore
//
//  Created by Malgorzata Mazurek on 4/5/25.
//

import Foundation
import FormValidator

class CheckoutForm: ObservableObject {
    @Published
    var manager = FormManager(validationType: .immediate)


    @FormField(validator: NonEmptyValidator(message: "This field is required!"))
    var firstName: String = ""

    lazy var firstNameValidation = _firstName.validation(manager: manager)
}

