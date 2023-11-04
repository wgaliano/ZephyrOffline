//
//  AddNewStudentView.swift
//  ZephyrTesting
//
//  Created by Вячеслав Горев on 7/9/2023.
//

import SwiftUI

struct AddNewStudentView: View {

    let isTabToAddStudent: Bool

    @StateObject var studentViewModel = StudentViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var requiredFieldsFilled = true
    @State var isShowingSpecialNeedsPicker = false
    @State var isShowingSkillsPicker = false
    @State var isShowingLanguagesPicker = false
    @State var alertInfo: AlertInfo?
    @State var showAlert = false

    // Required values
    @State var names: String = ""
    @State var surname: String = ""
    @State var dateOfBirth: Date = Date.now

    @State var identityNumber: String = ""
    @State var city: String = ""
    @State var address: String = ""
    @State var referenceContact: String = ""
    @State var school: String = ""

    // Multiple options picker
    @State var language: String = ""
    @State var specialNeeds: String = ""
    @State var skills: String = ""

    // Values for pickers
    @State var gender: String = "Select gender"
    @State var nationality: String = "Select nationality"
    @State var grade: String = "Select grade"
    @State var province: String = "Select province"
    @State var programme: String = "Select programme"

    var body: some View {
        VStack {
            if isTabToAddStudent {
                TabView {
                    Form {
                        anagraphical
                    }
                    .tag(0)
                    Form {
                        contact
                    }
                    .tag(1)
                    Form {
                        enrollment
                    }
                    .tag(2)
                    Form {
                        details
                    }
                    .tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            } else {
                Form {
                    anagraphical

                    contact

                    enrollment

                    details

                }
            }
        }
        .sheet(isPresented: $isShowingSkillsPicker) {
            MultiplePickerView(list: Student.skillsList, selection: $skills)
        }
        .sheet(isPresented: $isShowingSpecialNeedsPicker) {
            MultiplePickerView(list: Student.specialNeedsList, selection: $specialNeeds)
        }
        .sheet(isPresented: $isShowingLanguagesPicker) {
            MultiplePickerView(list: Student.languages, selection: $language)
        }
        .navigationBarTitle("New student", displayMode: .inline)
        .backCustomButton(isPresented: $showAlert, presentationMode: presentationMode, alertInfo: $alertInfo)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    if names.isEmpty || surname.isEmpty || Calendar.current.isDate(dateOfBirth, inSameDayAs: Date.now) {
                        requiredFieldsFilled = false
                    } else {
                        requiredFieldsFilled = true
                        showAlert.toggle()
                        self.alertInfo = AlertInfo(id: .addLearner, actionToPerform: {
                            var newStudent = Student(
                                primaryKey: nil,
                                names: names,
                                surname: surname,
                                gender: gender,
                                dateOfBirth: studentViewModel.stringFromDate(dateOfBirth),
                                nationality: nationality,
                                city: city,
                                address: address,
                                identityNumber: identityNumber,
                                language: language,
                                grade: grade,
                                school: school,
                                programme: programme,
                                referenceContact: referenceContact,
                                age: nil,
                                province: province,
                                skills: skills,
                                specialNeeds: specialNeeds
                            )

                            newStudent = studentViewModel.studentInputHandling(newStudent)
                            Task {
                                await studentViewModel.addNewStudent(newStudent: newStudent)
                            }
                            presentationMode.wrappedValue.dismiss()
                        })
                    }
                }
            }
        }
        .alert(isPresented: $showAlert, content: {
            alertInfo!.toAlert()
        })
    }
}

struct AddNewStudentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddNewStudentView(isTabToAddStudent: true)
        }
    }
}
