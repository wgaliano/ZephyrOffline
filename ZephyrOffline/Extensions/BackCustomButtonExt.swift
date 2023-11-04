//
//  BackCustomButtonExt.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 18/10/23.
//

import SwiftUI

extension View {
    func backCustomButton(isPresented: Binding<Bool>, presentationMode: Binding<PresentationMode>, alertInfo: Binding<AlertInfo?>) -> some View {
        
        self
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isPresented.wrappedValue.toggle()
                        alertInfo.wrappedValue = AlertInfo(id: .backButton, actionToPerform: {
                            presentationMode.wrappedValue.dismiss()
                        })
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.backward")
                                .fontWeight(.medium)
                            Text("Back")
                        }
                    }
                }
            }
    }
}
