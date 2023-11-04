//
//  StudentDetailViewExt.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 16/10/23.
//

import SwiftUI

extension StudentDetailView {

    // StudentInfo
    var anagraphical: some View {

        VStack(spacing: 10) {
            StudentDetailRowView(
                symbol: "person.fill",
                title: "Name",
                bodyInfo: "\(student.safeName) \(student.safeSurname)"
            )
            Divider()
            StudentDetailRowView(
                symbol: "person.fill",
                title: "Gender",
                bodyInfo: student.safeGender
            )
            Divider()
            StudentDetailRowView(
                symbol: "calendar",
                title: "Date of birth",
                bodyInfo: student.safeDateOfBirth
            )
            Divider()
            StudentDetailRowView(
                symbol: "globe.europe.africa.fill",
                title: "Nation of birth",
                bodyInfo: student.safeNationality
            )
            Divider()
            StudentDetailRowView(
                symbol: "menucard.fill",
                title: "Identity number",
                bodyInfo: student.safeIdentityNumber
            )
        }
        .mainRectangleExt()
    }

    // SchoolStudentInfo
    var enrollment: some View {
        VStack(spacing: 10) {
            StudentDetailRowView(
                symbol: "mappin.and.ellipse",
                title: "School",
                bodyInfo: student.safeSchool
            )
            Divider()

            StudentDetailRowView(
                symbol: "text.book.closed.fill",
                title: "Programme",
                bodyInfo: student.safeProgramme
            )
            Divider()

            StudentDetailRowView(
                symbol: "graduationcap.fill",
                title: "Grade",
                bodyInfo: student.safeGrade
            )
        }.mainRectangleExt()
    }

    // MapView, Student address, Reference Contact
    var contact: some View {
        VStack {
            StudentDetailRowView(
                symbol: "map.fill",
                title: "Address",
                bodyInfo: studentViewModel.checkAddress(
                    province: student.safeProvince,
                    city: student.safeCity,
                    address: student.safeAddress
                )
            )
            MapView()
                .cornerRadius(20)
            Divider()
            StudentDetailRowView(
                symbol: "person.circle.fill",
                title: "Reference Contact",
                bodyInfo: student.safeReferenceContact
            )
        }
        .mainRectangleExt()
    }

    // Languages and Skills
    var details: some View {
        VStack {
            StudentDetailRowView(
                symbol: "text.bubble.fill",
                title: "Languages",
                bodyInfo: student.safeLanguage
            )
            Divider()
            StudentDetailRowView(
                symbol: "list.bullet",
                title: "Skills",
                bodyInfo: student.safeSkills
            )
            Divider()
            StudentDetailRowView(
                symbol: "figure.2.arms.open",
                title: "Special Needs",
                bodyInfo: student.safeSpecialNeeds
            )
        }.mainRectangleExt()
    }

    // MARK: Previous programm section. For now commented because we don't have it in Figma
    //    var previousProgramms: some View {
    //                VStack(spacing: 10) {
    //                    StudentDetailRowView(
    //                        symbol: "figure.2.arms.open",
    //                        title: "Previous Programme",
    //                        bodyInfo: "Numeracy, Grade 2, 2022/2023"
    //                    )
    //
    //                }.mainRectangleExt()
    //    }
}
