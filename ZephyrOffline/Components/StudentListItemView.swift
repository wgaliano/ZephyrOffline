//
//  StudentListItemView.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 25/10/23.
//

import SwiftUI

struct StudentListItemView: View {

    var student: StudentEntity

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "person.fill")
                Text("\(student.safeName) \(student.safeSurname)")
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            Divider().frame(height: 50).background(Color("Gray"))
            HStack {
                Image(systemName: "graduationcap.fill")
                Text("Grade \(student.safeGrade)")
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            Divider().frame(height: 50).background(Color("Gray"))
            HStack {
                Image(systemName: "text.book.closed.fill")
                Text(student.safeProgramme)
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
            Divider().frame(height: 50).background(Color("Gray"))
            HStack {
                Image(systemName: "mappin.and.ellipse")
                Text(student.safeSchool)
                Spacer()
                Image(systemName: "chevron.right")
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 20)
        .background(.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.15), radius: 10, x: 2, y: 2)
    }
}

//#Preview {
//    StudentListItemView(
//        student: Student(
//            primaryKey: "",
//            names: "Hello",
//            surname: "Student",
//            gender: "",
//            dateOfBirth: "",
//            nationality: "",
//            city: "",
//            address: "",
//            identityNumber: "1",
//            language: "",
//            grade: "B",
//            school: "school name",
//            programme: "programm name",
//            referenceContact: "",
//            age: "",
//            province: "",
//            skills: "Skill1, Skill2",
//            specialNeeds: ""
//        )
//    )
//}
