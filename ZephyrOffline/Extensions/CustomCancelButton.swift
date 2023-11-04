//
//  CustomCancelButton.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 20/10/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func customCancelButton(isPresented: Binding<Bool>, isShow: Binding<Bool>, alertInfo: Binding<AlertInfo?>) -> some View {
        
        if isShow.wrappedValue {
            self
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button {
                            isPresented.wrappedValue.toggle()
                            alertInfo.wrappedValue = AlertInfo(id: .backButton, actionToPerform: {
                                isShow.wrappedValue.toggle()
                            })
                        } label: {
                            HStack(spacing: 4) {
                                Text("Cancel")
                            }
                        }
                    }
                }
        } else {
            self
        }
    }
}
