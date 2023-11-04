//
//  TextField-LettersExt.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 12/10/23.
//

import SwiftUI
import Combine

extension CustomTextField {
    func lettersAndSpacesOnly(input: Binding<String>) -> some View {
        self.modifier(LettersAndSpacesOnly(input: input))
    }
}

struct LettersAndSpacesOnly: ViewModifier {
    @Binding var input: String

    func body(content: Content) -> some View {
        content
            .onReceive(Just(input)) { newValue in
                let filtered = newValue.filter { $0.isLetter || $0.isWhitespace }
                if filtered != newValue {
                    self.input = filtered
                }
            }
    }
}

extension View {
    func redLabelMandatoryFields<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                if shouldShow {
                    placeholder()
                }
                self
            }
        }
}
