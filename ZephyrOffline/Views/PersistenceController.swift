//
//  PersistenceController.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 26/09/23.
//

import Foundation
import CoreData

class PersistenceController: ObservableObject {
    let container: NSPersistentContainer
    @Published var students: [StudentEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores { (_, error)  in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("SUCCESSFULLY LOADED CORE DATA!")
            }
        }
        fetchStudents()
    }
    
    func fetchStudents() {
        let request = NSFetchRequest<StudentEntity>(entityName: "StudentEntity")
        
        do {
            students = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addStudent(name: String,
                    surname: String,
                    gender: String,
                    dateOfBirth: String,
                    nationality: String,
                    city: String,
                    address: String,
                    language: String,
                    specialNeeds: String?,
                    identityNumber: String,
                    grade: String,
                    school: String,
                    programme: String,
                    referenceContact: String,
                    province: String,
                    skills: String
    ) {
        
        let newStudent = StudentEntity(context: container.viewContext)
        
        newStudent.names = name
        newStudent.surname = surname
        newStudent.gender = gender
        newStudent.dateOfBirth = dateOfBirth
        newStudent.nationality = nationality
        newStudent.city = city
        newStudent.address = address
        newStudent.language = language
        newStudent.specialNeeds = specialNeeds
        newStudent.identityNumber = identityNumber
        newStudent.grade = grade
        newStudent.school = school
        newStudent.programme = programme
        newStudent.referenceContact = referenceContact
        newStudent.province = province
        newStudent.skills = skills
        
        saveStudentsData()
    }
    
    func updateStudent(student: StudentEntity,
                       name: String,
                       surname: String,
                       gender: String,
                       dateOfBirth: String,
                       nationality: String,
                       city: String,
                       address: String,
                       language: String,
                       specialNeeds: String?,
                       identityNumber: String,
                       grade: String,
                       school: String,
                       programme: String,
                       referenceContact: String,
                       province: String,
                       skills: String
    ) {
        
        student.names = name
        student.surname = surname
        student.gender = gender
        student.dateOfBirth = dateOfBirth
        student.nationality = nationality
        student.city = city
        student.address = address
        student.language = language
        student.specialNeeds = specialNeeds
        student.identityNumber = identityNumber
        student.grade = grade
        student.school = school
        student.programme = programme
        student.referenceContact = referenceContact
        student.province = province
        student.skills = skills
        
        saveStudentsData()
    }
    
    func saveStudentsData() {
        do {
            try container.viewContext.save()
            fetchStudents()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
    
    func deleteStudent(student: StudentEntity) {
        container.viewContext.delete(student)
        
        saveStudentsData()
    }
}

extension StudentEntity {
    var safeName: String {
        get {
            return self.names ?? "-"
        }
        set {
            self.names = newValue
        }
    }
    
    var safeSurname: String {
        get {
            return self.surname ?? "-"
        }
        set {
            self.surname = newValue
        }
    }
    
    var safeGender: String {
        get {
            return self.gender ?? "-"
        }
        set {
            self.gender = newValue
        }
    }
    
    var safeDateOfBirth: String {
        get {
            return self.dateOfBirth ?? "-"
        }
        set {
            self.dateOfBirth = newValue
        }
    }
    
    var safeNationality: String {
        get {
            return self.nationality ?? "-"
        }
        set {
            self.nationality = newValue
        }
    }
    
    var safeCity: String {
        get {
            return self.city ?? "-"
        }
        set {
            self.city = newValue
        }
    }
    
    var safeAddress: String {
        get {
            return self.address ?? "-"
        }
        set {
            self.address = newValue
        }
    }
    
    var safeLanguage: String {
        get {
            return self.language ?? "-"
        }
        set {
            self.language = newValue
        }
    }
    
    var safeSpecialNeeds: String {
        get {
            return self.specialNeeds ?? "-"
        }
        set {
            self.specialNeeds = newValue
        }
    }
    
    var safeIdentityNumber: String {
        get {
            return self.identityNumber ?? "-"
        }
        set {
            self.identityNumber = newValue
        }
    }
    
    var safeGrade: String {
        get {
            return self.grade ?? "-"
        }
        set {
            self.grade = newValue
        }
    }
    
    var safeSchool: String {
        get {
            return self.school ?? "-"
        }
        set {
            self.school = newValue
        }
    }
    
    var safeProgramme: String {
        get {
            return self.programme ?? "-"
        }
        set {
            self.programme = newValue
        }
    }
    
    var safeReferenceContact: String {
        get {
            return self.referenceContact ?? "-"
        }
        set {
            self.referenceContact = newValue
        }
    }
    
    var safeProvince: String {
        get {
            return self.province ?? "-"
        }
        set {
            self.province = newValue
        }
    }
    
    var safeSkills: String {
        get {
            return self.skills ?? "-"
        }
        set {
            self.skills = newValue
        }
    }
}
