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
                parameter: Binding(
                    get: { student.safeName },
                    set: { student.safeName = $0 }
                )
            )
            Divider()
            StudentDetailEditRowTextWithoutSymbolsView(
                symbol: "person.fill",
                title: "Surname",
                parameter: Binding<String>(
                    get: { student.safeSurname },
                    set: { student.safeSurname = $0 }
                )
            )
            Divider()
            StudentDetailEditRowPickView(
                symbol: "person.fill",
                title: "Gender",
                array: Student.genderValues,
                parameter: Binding<String>(
                    get: { student.safeGender },
                    set: { student.safeGender = $0 }
                )
            )
            Divider()
            StudentDetailEditRowDateView(
                symbol: "calendar",
                title: "Date of birth",
                parameter: Binding<String>(
                    get: { student.safeDateOfBirth },
                    set: { student.safeDateOfBirth = $0 }
                )
            )
            Divider()
            StudentDetailEditRowPickView(
                symbol: "globe.europe.africa.fill",
                title: "Nation of birth",
                array: studentViewModel.loadNations(),
                parameter: Binding<String>(
                    get: { student.safeNationality },
                    set: { student.safeNationality = $0 }
                )
            )
            Divider()
            StudentDetailEditRowIntView(
                symbol: "menucard.fill",
                title: "Identity number",
                parameter: Binding<String>(
                    get: { student.safeIdentityNumber },
                    set: { student.safeIdentityNumber = $0 }
                )
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
                parameter: Binding<String>(
                    get: { student.safeSchool },
                    set: { student.safeSchool = $0 }
                )
            )
            Divider()

            StudentDetailEditRowPickView(
                symbol: "text.book.closed.fill",
                title: "Programme",
                array: Student.programmes,
                parameter: Binding<String>(
                    get: { student.safeProgramme },
                    set: { student.safeProgramme = $0 }
                )
            )
            Divider()

            StudentDetailEditRowPickView(
                symbol: "graduationcap.fill",
                title: "Grade",
                array: Student.grades,
                parameter: Binding<String>(
                    get: { student.safeGrade },
                    set: { student.safeGrade = $0 }
                )
            )
        }.mainRectangleExt()
    }

    // MapView, Student address, Reference Contact
    var editContact: some View {
        VStack {
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "Province",
                parameter: Binding<String>(
                    get: { student.safeProvince },
                    set: { student.safeProvince = $0 }
                )
            )
            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "City",
                parameter: Binding<String>(
                    get: { student.safeCity },
                    set: { student.safeCity = $0 }
                )
            )

            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "map.fill",
                title: "Address",
                parameter: Binding<String>(
                    get: { student.safeAddress },
                    set: { student.safeAddress = $0 }
                )
            )
            Divider()
            StudentDetailEditRowTextWithSymbolsView(
                symbol: "person.circle.fill",
                title: "Reference Contact",
                parameter: Binding<String>(
                    get: { student.safeReferenceContact },
                    set: { student.safeReferenceContact = $0 }
                )
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
                parameter: Binding<String>(
                    get: { student.safeLanguage },
                    set: { student.safeLanguage = $0 }
                ),
                isShowingButton: $isShowingLanguagesPicker
            )
            Divider()
            StudentDetailEditRowMultiPickView(
                symbol: "list.bullet",
                title: "Skills",
                parameter: Binding<String>(
                    get: { student.safeSkills },
                    set: { student.safeSkills = $0 }
                ),
                isShowingButton: $isShowingSkillsPicker
            )
            Divider()
            StudentDetailEditRowMultiPickView(
                symbol: "figure.2.arms.open",
                title: "Special Needs",
                parameter: Binding<String>(
                    get: { student.safeSpecialNeeds },
                    set: { student.safeSpecialNeeds = $0 }
                ),
                isShowingButton: $isShowingSpecialNeedsPicker
            )
        }.mainRectangleExt()
    }
}
