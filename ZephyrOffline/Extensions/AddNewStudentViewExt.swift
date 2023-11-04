//
//  AddNewStudentTabViewExt.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 26/10/23.
//

import SwiftUI

extension AddNewStudentView {
    var anagraphical: some View {

            Section(header: Text("Anagraphical"), footer: Text("* Mandatory fields")) {
                CustomTextField("Names *", text: $names)
                    .lettersAndSpacesOnly(input: $names)
                    .redLabelMandatoryFields(when: !requiredFieldsFilled && names.isEmpty) {
                                            Text("Names *").foregroundColor(.red)}

                CustomTextField("Surname *", text: $surname)
                    .lettersAndSpacesOnly(input: $surname)
                    .redLabelMandatoryFields(when: !requiredFieldsFilled && surname.isEmpty) {
                                            Text("Surname *").foregroundColor(.red)}

                Picker("Gender", selection: $gender) {
                    ForEach(Student.genderValues, id: \.self) {
                        Text($0)
                    }
                }

                DatePicker(selection: $dateOfBirth, in: ...Date.now, displayedComponents: .date) {
                    Text("Date of birth *")
                }
                .foregroundColor(
                    !requiredFieldsFilled && Calendar.current.isDate(dateOfBirth, inSameDayAs: Date.now)
                    ? Color("RedTextfield")
                    : .primary
                )

                Picker("Nationality", selection: $nationality) {
                    ForEach(studentViewModel.loadNations(), id: \.self) {
                        Text($0)
                    }
                }

                CustomTextField("Identity Number", text: $identityNumber)
                    .numericOnly(input: $identityNumber)
                    .keyboardType(.numberPad)
            }

    }
}

extension AddNewStudentView {
    var contact: some View {

            Section(header: Text("Contact")) {
                Picker("Province", selection: $province) {
                    ForEach(Student.provinces, id: \.self) {
                        Text($0)
                    }
                }

                CustomTextField("City", text: $city)
                CustomTextField("Address", text: $address)
                CustomTextField("Reference contact", text: $referenceContact)
            }

    }
}

extension AddNewStudentView {
    var enrollment: some View {

            Section(header: Text("Enrollment")) {

                CustomTextField("School", text: $school)

                Picker("Grade", selection: $grade) {
                    ForEach(Student.grades, id: \.self) {
                        Text($0)
                    }
                }

                Picker("Programme", selection: $programme) {
                    ForEach(Student.programmes, id: \.self) {
                        Text($0)
                    }
                }
            }

    }
}

extension AddNewStudentView {
    var details: some View {
        
            Section(header: Text("Details")) {
                HStack {
                    if language.isEmpty {
                        Text("No languages")
                    } else {
                        Text(language)
                    }
                    Spacer()
                    Button {
                        isShowingLanguagesPicker.toggle()
                    } label: {
                        Text("Choose languages")
                    }
                }

                HStack {
                    if skills.isEmpty {
                        Text("No skills")
                    } else {
                        Text(skills)
                    }
                    Spacer()
                    Button {
                        isShowingSkillsPicker.toggle()
                    } label: {
                        Text("Choose skills")
                    }
                }
                HStack {
                    if specialNeeds.isEmpty {
                        Text("No special needs")
                    } else {
                        Text(specialNeeds)
                    }
                    Spacer()
                    Button {
                        isShowingSpecialNeedsPicker.toggle()
                    } label: {
                        Text("Choose special needs")
                    }
                }
            }

    }
}
