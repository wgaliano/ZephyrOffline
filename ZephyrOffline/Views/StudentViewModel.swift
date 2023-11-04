//
//  StudentViewModel.swift
//  ZephyrTesting
//
//  Created by Вячеслав Горев on 8/9/2023.
//

import SwiftUI

class StudentViewModel: ObservableObject {
    @Published var students: [Student] = []
    
    private let studentData = StudentData()
    
    @MainActor
    func loadStudents() async {
        do {
            students = try await studentData.fetchStudents()
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    @MainActor
    func addNewStudent(newStudent: Student) async {
        do {
            try await studentData.addNewStudent(newStudent: newStudent)
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func deleteStudent(studentPrimaryKey: String) async {
        do {
            try await studentData.deleteStudent(studentPrimaryKey: studentPrimaryKey)
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func editStudent(_ updatedStudent: Student) async {
        do {
            try await studentData.editRecord(updatedStudent)
        } catch {
            print(error)
        }
    }
    
    func loadNations() -> [String] {
        var nations: [String] = []
        
        if let fileURL = Bundle.main.url(forResource: "nations", withExtension: "txt") {
            do {
                let content = try String(contentsOf: fileURL, encoding: .utf8)
                let lines = content.components(separatedBy: "\n")
                nations = lines.filter { !$0.isEmpty }
            } catch {
                print("Error while reading the file: \(error)")
            }
        }
        
        return nations
    }
    
    func dateFromString(_ dateString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: dateString)
    }
    
    func stringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    
    func changeValueIfNil<T: Equatable>(input: T, value: T) -> T {
        if input == "-" as? T || input == 0 as? T || input == "0" as? T {
            return value
        }
        return input
    }
    
    func checkAddress(province: String, city: String, address: String) -> String {
        if province == "-" || province == "" {
            return "-"
        } else if city == "-" || city == "" {
            return "\(province)"
        } else if address == "-" || address == "" {
            return "\(province), \(city)"
        }
        return "\(province), \(city), \(address)"
    }
    
    func removeExtraSpaces(from input: String) -> String {
        let components = input.split(separator: " ")
        let filteredComponents = components.filter { !$0.isEmpty }
        let result = filteredComponents.joined(separator: " ")
        return result.isEmpty ? "-" : result
    }
    
    func handleEmptyInput(_ input: String) -> String {
        return removeExtraSpaces(from: input)
//        return input.isEmpty ? "-" : removeExtraSpaces(from: input)
    }
    
    func handleEmptyPickerValue(_ selection: String, _ defaultArray: [String]) -> String {
        return selection == defaultArray.first ? "-" : selection
    }
    
    func studentInputHandling(_ student: StudentEntity) -> StudentEntity {
        var studentWithNoEmptyFields : StudentEntity = student
        
        studentWithNoEmptyFields.names = handleEmptyInput(studentWithNoEmptyFields.safeName)
        studentWithNoEmptyFields.surname = handleEmptyInput(studentWithNoEmptyFields.safeSurname)
        studentWithNoEmptyFields.gender = handleEmptyPickerValue(studentWithNoEmptyFields.safeGender, Student.genderValues)
        studentWithNoEmptyFields.nationality = handleEmptyPickerValue(studentWithNoEmptyFields.safeNationality, loadNations())
        studentWithNoEmptyFields.city = handleEmptyInput(studentWithNoEmptyFields.safeCity)
        studentWithNoEmptyFields.address = handleEmptyInput(studentWithNoEmptyFields.safeAddress)
        studentWithNoEmptyFields.language = handleEmptyInput(studentWithNoEmptyFields.safeLanguage)
        studentWithNoEmptyFields.identityNumber = handleEmptyInput(studentWithNoEmptyFields.safeIdentityNumber)
        studentWithNoEmptyFields.grade = handleEmptyPickerValue(studentWithNoEmptyFields.safeGrade, Student.grades)
        studentWithNoEmptyFields.school = handleEmptyInput(studentWithNoEmptyFields.safeSchool)
        studentWithNoEmptyFields.programme = handleEmptyPickerValue(studentWithNoEmptyFields.safeProgramme, Student.programmes)
        studentWithNoEmptyFields.referenceContact = handleEmptyInput(studentWithNoEmptyFields.safeReferenceContact)
        studentWithNoEmptyFields.province = handleEmptyPickerValue(studentWithNoEmptyFields.safeProvince, Student.provinces)
        studentWithNoEmptyFields.skills = handleEmptyInput(studentWithNoEmptyFields.safeSkills)
        studentWithNoEmptyFields.specialNeeds = handleEmptyInput(studentWithNoEmptyFields.safeSpecialNeeds)
        
        return studentWithNoEmptyFields
    }
}
