//
//  AlertInfo.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 25/10/23.
//

import SwiftUI

struct AlertInfo: Identifiable {
    
    enum AlertType {
        case addLearner
        case editLearner
        case deleteLearner
        case backButton
//        case cancelButton
    }
    
    let id: AlertType
    var actionToPerform: (() -> Void)?
    
    func toAlert() -> Alert {
        switch id {
        case .addLearner:
            return Alert(
                title: Text("Do you want to add this learner?"),
                message: Text("This learner will be added to the learner list."),
                primaryButton: .default(Text("Add"), action: {
                    actionToPerform?()
                }),
                secondaryButton: .cancel()
            )
        case .editLearner:
            return Alert(
                title: Text("Do you want to edit this learner?"),
                message: Text("This learner will be edited."),
                primaryButton: .default(Text("Save"), action: {
                    actionToPerform?()
                }),
                secondaryButton: .cancel()
            )
        case .deleteLearner:
            return Alert(
                title: Text("Do you want to delete this learner?"),
                message: Text("This learner will be deleted from the learner list."),
                primaryButton: .destructive(Text("Delete"), action: {
                    actionToPerform?()
                }),
                secondaryButton: .cancel()
            )
        case .backButton:
            return Alert(
                title: Text("Are you sure you want to go back?"),
                message: Text("If you go back without saving you will lose your changes."),
                primaryButton: .destructive(Text("Go back"), action: {
                    actionToPerform?()
                }),
                secondaryButton: .cancel()
            )
            // MARK: We have to decide about text
//        case .cancelButton:
//            return Alert(
//                title: Text(""),
//                message: Text(""),
//                primaryButton: .destructive(Text(""), action: {
//                    actionToPerform?()
//                }),
//                secondaryButton: .cancel()
//            )
        }
    }
}
