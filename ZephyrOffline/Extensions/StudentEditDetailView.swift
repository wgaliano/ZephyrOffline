//
//  StudentEditDetailView.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 17/10/23.
//

import SwiftUI

extension StudentDetailView {

    // StudentInfo
    var editAnagraphical: some View {

        VStack(spacing: 10) {
            StudentDetailEditRowTextWithoutSymbolsView(
                symbol: "person.fill",
                title: "Name",
                parameter: $student.names
            )
            Divider()
            StudentDetailEditRowTextWithoutSymbolsView(
                symbol: "person.fill",
                title: "Surname",
                parameter: $student.surname
            )
            Divider()
            StudentDetailEditRowPickView(
                symbol: "person.fill",
                title: "Gender",
                array: Student.genderValues,
                parameter: $student.gender
            )
            Divider()
            StudentDetailEditRowDateView(
                symbol: "calendar",
                title: "Date of birth",
                parameter: $student.dateOfBirth
            )
            Divider()
            StudentDetailEditRowPickView(
                symbol: "globe.europe.africa.fill",
                title: "Nation of birth",
                array: studentViewModel.loadNations(),
                parameter: $student.nationality
            )
            Divider()
            StudentDetailEditRowIntView(
                symbol: "menucard.fill",
                title: "Identity number",
                parameter: $student.identityNumber
            )
        }
        .mainRectangleExt()
    }

    // SchoolStudentInfo
    var editEnrollment: some View {
        VStack(spacing: 10) {
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "mappin.and.ellipse",
                title: "School",
                parameter: $student.school
            )
            Divider()

            StudentDetailEditRowPickView(
                symbol: "text.book.closed.fill",
                title: "Programme",
                array: Student.programmes,
                parameter: $student.programme
            )
            Divider()

            StudentDetailEditRowPickView(
                symbol: "graduationcap.fill",
                title: "Grade",
                array: Student.grades,
                parameter: $student.grade
            )
        }.mainRectangleExt()
    }

    // MapView, Student address, Reference Contact
    var editContact: some View {
        VStack {
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "Province",
                parameter: $student.province
            )
            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "City",
                parameter: $student.city
            )

            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "Address",
                parameter: $student.address
            )
            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "person.circle.fill",
                title: "Reference Contact",
                parameter: $student.referenceContact
            )
        }
        .mainRectangleExt()
    }

    // Languages and Skills
    var editDetails: some View {
        VStack {
            StudentDetailEditRowMultiPickView(
                symbol: "text.bubble.fill",
                title: "Languages",
                parameter: $student.language,
                isShowingButton: $isShowingLanguagesPicker
            )
            Divider()
            StudentDetailEditRowMultiPickView(
                symbol: "list.bullet",
                title: "Skills",
                parameter: $student.skills,
                isShowingButton: $isShowingSkillsPicker
            )
            Divider()
            StudentDetailEditRowMultiPickView(
                symbol: "figure.2.arms.open",
                title: "Special Needs",
                parameter: $student.specialNeeds,
                isShowingButton: $isShowingSpecialNeedsPicker
            )
        }.mainRectangleExt()
    }
}
