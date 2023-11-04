//
//  CustomTextFieldView.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 13/10/23.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    @Binding var text: String

    init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }

    var body: some View {
        HStack {
            TextField(title, text: $text)
            if !text.isEmpty {
                Button {
                    self.text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(8)
                }
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField("Field name", text: .constant("Text"))
    }
}
