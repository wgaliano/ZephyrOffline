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
                parameter: $newName
            )
            Divider()
            StudentDetailEditRowTextWithoutSymbolsView(
                symbol: "person.fill",
                title: "Surname",
                parameter: $newSurname
            )
            Divider()
            StudentDetailEditRowPickView(
                symbol: "person.fill",
                title: "Gender",
                array: Student.genderValues,
                parameter: $newGender
            )
            Divider()
            StudentDetailEditRowDateView(
                symbol: "calendar",
                title: "Date of birth",
                parameter: $newDateOfBirth
            )
            Divider()
            StudentDetailEditRowPickView(
                symbol: "globe.europe.africa.fill",
                title: "Nation of birth",
                array: studentViewModel.loadNations(),
                parameter: $newNationality
            )
            Divider()
            StudentDetailEditRowIntView(
                symbol: "menucard.fill",
                title: "Identity number",
                parameter: $newIdentityNumber
            )
        }
        .mainRectangleExt()
        .onAppear(perform: {
            newName = student.safeName
            newSurname = student.safeSurname
            newGender = student.safeGender
            newDateOfBirth = student.safeDateOfBirth
            newNationality = student.safeNationality
            newIdentityNumber = student.safeIdentityNumber
        })
    }

    // SchoolStudentInfo
    var editEnrollment: some View {
        VStack(spacing: 10) {
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "mappin.and.ellipse",
                title: "School",
                parameter: $newSchool
            )
            Divider()

            StudentDetailEditRowPickView(
                symbol: "text.book.closed.fill",
                title: "Programme",
                array: Student.programmes,
                parameter: $newProgramme
            )
            Divider()

            StudentDetailEditRowPickView(
                symbol: "graduationcap.fill",
                title: "Grade",
                array: Student.grades,
                parameter: $newGrade
            )
        }
        .mainRectangleExt()
        .onAppear(perform: {
            newSchool = student.safeSchool
            newProgramme = student.safeProgramme
            newGrade = student.safeGrade
        })
    }

    // MapView, Student address, Reference Contact
    var editContact: some View {
        VStack {
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "Province",
                parameter: $newProvince
            )
            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "City",
                parameter: $newCity
            )

            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "Address",
                parameter: $newAddress
            )
            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "person.circle.fill",
                title: "Reference Contact",
                parameter: $newReferenceContact
            )
        }
        .mainRectangleExt()
        .onAppear(perform: {
            newProvince = student.safeProvince
            newCity = student.safeCity
            newAddress = student.safeAddress
            newReferenceContact = student.safeReferenceContact
        })
    }

    // Languages and Skills
    var editDetails: some View {
        VStack {
            StudentDetailEditRowMultiPickView(
                symbol: "text.bubble.fill",
                title: "Languages",
                parameter: $newLanguage,
                isShowingButton: $isShowingLanguagesPicker
            )
            Divider()
            StudentDetailEditRowMultiPickView(
                symbol: "list.bullet",
                title: "Skills",
                parameter: $newSkills,
                isShowingButton: $isShowingSkillsPicker
            )
            Divider()
            StudentDetailEditRowMultiPickView(
                symbol: "figure.2.arms.open",
                title: "Special Needs",
                parameter: $newSpecialNeeds,
                isShowingButton: $isShowingSpecialNeedsPicker
            )
        }
        .mainRectangleExt()
        .onAppear(perform: {
            newLanguage = student.safeLanguage
            newSkills = student.safeSkills
            newSpecialNeeds = student.safeSpecialNeeds
        })
    }
}
