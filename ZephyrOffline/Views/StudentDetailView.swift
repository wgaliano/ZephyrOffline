//
//  StudentDetailView.swift
//  ZephyrTesting
//
//  Created by Вячеслав Горев on 7/9/2023.
//

import SwiftUI

struct StudentDetailView: View {

    @State var student: StudentEntity
    @StateObject var studentViewModel = StudentViewModel()
    @State var alertInfo: AlertInfo?
    @State var showAlert = false

    @Environment(\.presentationMode) var presentationMode

    @State private var isEditable = false

    @State var isShowingSpecialNeedsPicker = false
    @State var isShowingSkillsPicker = false
    @State var isShowingLanguagesPicker = false

    var body: some View {

        VStack {
            Color.white
                .frame(height: 0)
            Text("\(student.safeName) \(student.safeSurname)")
                .font(.title)
                .bold()
        }
        ScrollView {
            HStack(spacing: 30) {
                VStack(spacing: 30) {
                    // STUDENT INFO AND STUDENT SCHOOL VERTICAL GROUP
                    VStack(alignment: .leading) {
                        Text("ANAGRAPHICAL")
                            .padding(.leading)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        if isEditable {
                            editAnagraphical
                        } else {
                            anagraphical
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("ENROLLMENT")
                            .padding(.leading)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        if isEditable {
                            editEnrollment
                        } else {
                            enrollment
                        }
                    }
                    Spacer()
                }
                VStack(spacing: 30) {
                    // MAP AND LANGUAGES VERTICAL GROUPS
                    VStack(alignment: .leading) {
                        Text("CONTACT")
                            .padding(.leading)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        if isEditable {
                            editContact
                        } else {
                            contact
                        }
                    }
                    VStack(alignment: .leading) {
                        Text("DETAILS")
                            .padding(.leading)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                        if isEditable {
                            editDetails
                        } else {
                            details
                        }
                    }
                    Spacer()
                }
            }
            .padding(.vertical, 30)
            if isEditable {

                Button {
                    showAlert.toggle()
                    self.alertInfo = AlertInfo(id: .deleteLearner, actionToPerform: {
//                        guard let primaryKey = student.primaryKey else {
//                            print("ERROR: Primary key is nil.")
//                            return
//                        }
                        
//                        Task {
//                            await studentViewModel.deleteStudent(studentPrimaryKey: primaryKey)
//                        }
                        presentationMode.wrappedValue.dismiss()
                    })
                    
                } label: {
                    HStack {
                        Image(systemName: "xmark.bin")
                            .foregroundColor(Color("Red100"))
                        Text("Delete student")
                            .foregroundColor(Color("Red100"))
                    }
                    .frame(width: 400)
                    .mainRectangleExt()
                }
            }
        }
        .padding(.horizontal)
        .background(Color("Gray"))
        .sheet(isPresented: $isShowingSkillsPicker) {
            MultiplePickerView(
                list: Student.skillsList,
                selection: Binding<String>(
                    get: { student.safeSkills },
                    set: { student.safeSkills = $0 }
                )
            )
        }
        .sheet(isPresented: $isShowingSpecialNeedsPicker) {
            MultiplePickerView(
                list: Student.specialNeedsList,
                selection: Binding<String>(
                    get: { student.safeSpecialNeeds },
                    set: { student.safeSpecialNeeds = $0 }
                )
            )
        }
        .sheet(isPresented: $isShowingLanguagesPicker) {
            MultiplePickerView(
                list: Student.languages,
                selection: Binding<String>(
                    get: { student.safeLanguage },
                    set: { student.safeLanguage = $0 }
                )
            )
        }
        .customCancelButton(isPresented: $showAlert, isShow: $isEditable, alertInfo: $alertInfo)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                if isEditable {
                    Button {
                        showAlert.toggle()
                        self.alertInfo = AlertInfo(id: .editLearner, actionToPerform: {
                            student = studentViewModel.studentInputHandling(student)
//                            Task {
//                                await studentViewModel.editStudent(student)
//                            }
                            isEditable.toggle()
//                            presentationMode.wrappedValue.dismiss()
                        })
                    } label: {
                        Text("Save")
                    }
                    .disabled(
                        student.safeName.isEmpty ||
                        student.safeSurname.isEmpty ||
                        Calendar.current.isDate(
                            studentViewModel.dateFromString(
                                student.safeDateOfBirth) ?? Date.now,
                            inSameDayAs: Date.now)
                    )
                } else {
                    Button {
                        isEditable.toggle()
                    } label: {
                        Text("Edit")
                    }
                }
            }
        }
        .alert(isPresented: $showAlert, content: {
            alertInfo!.toAlert()
        })
    }
}

//struct StudentDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            StudentDetailView(
//                student: Student(
//                    primaryKey: "",
//                    names: "Name",
//                    surname: "Surname",
//                    gender: "Not specified",
//                    dateOfBirth: "01/01/2000",
//                    nationality: "Italy",
//                    city: "City",
//                    address: "Address",
//                    identityNumber: "12345",
//                    language: "English",
//                    grade: "Grade",
//                    school: "School",
//                    programme: "Programme",
//                    referenceContact: "Reference",
//                    age: "1",
//                    province: "Province",
//                    skills: "Skill1, Skill2",
//                    specialNeeds: "Special needs"
//                )
//            )
//        }
//    }
//}
