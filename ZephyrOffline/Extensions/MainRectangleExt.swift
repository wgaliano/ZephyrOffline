//
//  Extensions.swift
//  ZephyrTesting
//
//  Created by Filomena Stellino on 26/09/23.
//

import Foundation
import SwiftUI

// MARK: ...EXTENSION FOR MAIN RECTANGLES

extension View {
    func mainRectangleExt() -> some View {
        self
            .padding()
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25), radius: 15, x: 4, y: 4)
    }
}
