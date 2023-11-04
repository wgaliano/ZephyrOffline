//
//  NameValidationExt.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 11/10/23.
//

import SwiftUI
import Combine

extension CustomTextField {
    func numericOnly(input: Binding<String>) -> some View {
        self.modifier(NumericOnly(input: input))
    }
}

struct NumericOnly: ViewModifier {
    @Binding var input: String
    
    func body(content: Content) -> some View {
        content
            .onReceive(Just(input)) { newValue in
                if newValue == "-" {
                    let filtered = newValue.filter { "-".contains($0) }
                    if filtered != newValue {
                        self.input = filtered
                    }
                } else {
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.input = filtered
                    }
                }
            }
    }
}
