//
//  smallerRectangleExt.swift
//  ZephyrTesting
//
//  Created by Filomena Stellino on 27/09/23.
//

import Foundation
import SwiftUI

// MARK: - EXTENSION FOR SMALLER RECTANGLES

extension View {
    func smallerRectangleExt() -> some View {
        self
            .ignoresSafeArea()
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .frame(alignment: .leading)
            .background(Color("LightTeal"))
            .cornerRadius(10)
    }
}
