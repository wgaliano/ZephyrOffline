//
//  Student.swift
//  ZephyrTesting
//
//  Created by Вячеслав Горев on 7/9/2023.
//

import Foundation

struct Student: Hashable, Codable {
    let primaryKey: String?
    var names: String
    var surname: String
    var gender: String
    var dateOfBirth: String
    var nationality: String
    var city: String
    var address: String
    var identityNumber: String
    var language: String // multiple choice
    var grade: String
    var school: String
    var programme: String
    var referenceContact: String
    let age: String? // shouldn't be editable cause it's calculated from dateOfBirth
    var province: String
    var skills: String // multiple choice
    var specialNeeds: String // multiple choice

    enum CodingKeys: String, CodingKey {
        case primaryKey = "PrimaryKey"
        case names = "Names"
        case surname = "Surname"
        case gender = "Gender"
        case dateOfBirth = "DateOfBirth"
        case nationality = "Nationality"
        case city = "City"
        case address = "Address"
        case identityNumber = "IdentityNumber"
        case language = "Language"
        case grade = "Grade"
        case school = "School"
        case programme = "Programme"
        case referenceContact = "ReferenceContact"
        case age = "Age"
        case province = "Province"
        case skills = "Skills"
        case specialNeeds = "SpecialNeeds"
    }

    static let genderValues = ["Select gender", "Not specified", "F", "M"]

    static let skillsList = [
    "Reading",
    "Writing",
    "Numeracy",
    "Calculus",
    "Basic geometry",
    "Collaboration",
    "Digital skills"
    ]

    static let specialNeedsList = [
        "Attention deficit disorder",
        "Autistic spectrum disorder",
        "Behavioural disorder",
        "Blind",
        "Cerebral palsied",
        "Deaf",
        "Deaf/blind disabled",
        "Epilepsy",
        "Hard of hearing",
        "Mild/moderate intellectually disabled",
        "Moderate to severe intellectual disabled",
        "Partially sighted",
        "Physically disabled",
        "Psychiatric disorder",
        "Severe intellectually disabled",
        "Specific learning disability",
        "Other"
    ]

    static let grades = ["Select grade", "R", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]

    static let provinces = [
        "Select province",
        "Eastern Cape",
        "Free State",
        "Gauteng",
        "KwaZulu-Natal",
        "Limpopo",
        "Mpumalanga",
        "North West",
        "Northern Cape",
        "Western Cape"
    ]

    static let languages = [
        "Afrikaans",
        "English",
        "Sepedi",
        "South African Sign Language",
        "Southern Ndebele",
        "Southern Sotho",
        "Swazi",
        "Tsonga",
        "Tswana",
        "Venda",
        "Xhosa",
        "Zulu"
    ]

    static let programmes = [
        "Select programme",
        "#Myfuture",
        "Digital Libraries",
        "Numeracy",
        "Inclusion",
        "Coding & Robotics",
        "Early Learning"
    ]
}
