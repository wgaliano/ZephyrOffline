//
//  LearnerItemView.swift
//  ZephyrTesting
//
//  Created by Viacheslav on 20/09/23.
//

import SwiftUI

struct LearnerItemView: View {
    
    var student: StudentEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(student.safeName) \(student.safeSurname)")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(Color("DarkTeal"))
                    .padding(.horizontal)
                Spacer()
                HStack {
                    Image(systemName: "graduationcap.fill")
                    Text("Grade")
                    Text(student.safeGrade)
                }.smallerRectangleExt()
            }
            VStack {
                StudentDetailRowView(
                    symbol: "mappin.and.ellipse",
                    title: "School",
                    bodyInfo: student.safeSchool
                )
                
                StudentDetailRowView(
                    symbol: "text.book.closed.fill",
                    title: "Programme",
                    bodyInfo: student.safeProgramme
                )
            }.smallerRectangleExt()
        }.mainRectangleExt()
    }
}

//struct LearnerItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        LearnerItemView(
//            student: Student(
//                primaryKey: "",
//                names: "Hello",
//                surname: "Student",
//                gender: "",
//                dateOfBirth: "",
//                nationality: "",
//                city: "",
//                address: "",
//                identityNumber: "1",
//                language: "",
//                grade: "B",
//                school: "This is a school name",
//                programme: "And that is a programm name",
//                referenceContact: "",
//                age: "",
//                province: "",
//                skills: "Skill1, Skill2",
//                specialNeeds: ""
//            )
//        )
//    }
//}
