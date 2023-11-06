//
//  ContentView.swift
//  ZephyrTesting
//
//  Created by Walter Galiano on 14/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State private var isModalPresented = false
    @State private var isListView = false
    @State private var isTabToAddStudent = false
    @StateObject private var studentViewModel = StudentViewModel()
    @StateObject var controllerVM = PersistenceController()
    
    var body: some View {
        VStack {
            HStack {
                Text("Learners")
                    .font(.system(size: 50, weight: .semibold))
            }
            .frame( height: 100)
            
            CustomToolbarView(searchText: $searchText, isTabToAddStudent: $isTabToAddStudent)
            
            ScrollView {
                Spacer(minLength: 30)
                
                if isListView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 50), GridItem(.flexible(), spacing: 50)]) {
                        ForEach(controllerVM.students.sorted(by: { $0.safeName < $1.safeName }), id: \.self) { student in
                            if searchText.isEmpty ||
                                student.safeName.localizedCaseInsensitiveContains(searchText) ||
                                student.safeSurname.localizedCaseInsensitiveContains(searchText) {
                                NavigationLink {
                                    StudentDetailView(student: student, controllerVM: controllerVM)
                                } label: {
                                    LearnerItemView(student: student)
                                        .padding(.bottom, 20)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding(.all)
                } else {
                    ForEach(controllerVM.students.sorted(by: { $0.safeName < $1.safeName }), id: \.self) { student in
                        if searchText.isEmpty ||
                            student.safeName.localizedCaseInsensitiveContains(searchText) ||
                            student.safeSurname.localizedCaseInsensitiveContains(searchText) {
                            NavigationLink {
                                StudentDetailView(student: student, controllerVM: controllerVM)
                            } label: {
                                StudentListItemView(student: student)
                                    .padding(.horizontal, 20)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .onDelete(perform: deleteStudent)
                }
            }
            .background(Color("Gray"))
        }
        .background(Color.white)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    controllerVM.fetchStudents()
                } label: {
                    
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.black)
                        .font(.system(size: 28))
                    
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isTabToAddStudent.toggle()
                } label: {
                    if isTabToAddStudent {
                        Image(systemName: "sun.max")
                            .foregroundColor(.black)
                            .font(.system(size: 28))
                    } else {
                        Image(systemName: "moon")
                            .foregroundColor(.black)
                            .font(.system(size: 28))
                    }
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isListView.toggle()
                } label: {
                    if isListView {
                        Image(systemName: "tablecells")
                            .foregroundColor(.black)
                            .font(.system(size: 28))
                    } else {
                        Image(systemName: "list.bullet")
                            .foregroundColor(.black)
                            .font(.system(size: 28))
                    }
                }
            }
        }
        .onAppear {
            if studentViewModel.isTheFirstTime == false {
                //add 20 students
                controllerVM.addStudent(name: "Siya", surname: "Naidoo", gender: "M", dateOfBirth: "2008-02-05", nationality: "South Africa", city: "Emkantini", address: "Andrew Mapheto Dr", language: "English, Zulu", specialNeeds: "Behavioural disorder", identityNumber: "6186595851988", grade: "10", school: "Tembisa High School", programme: "#Myfuture", referenceContact: "000000", province: "Mpumalanga", skills: "Collaboration, Calculus")
                
                controllerVM.addStudent(name: "Yanela", surname: "Bhengu", gender: "M", dateOfBirth: "2009-07-12", nationality: "South Africa", city: "Mhluzi", address: "2009 Manasse St", language: "English", specialNeeds: "Behavioural disorder", identityNumber: "9090424902291", grade: "9", school: "Sozama High School", programme: "#Myfuture", referenceContact: "000000", province: "Mpumalanga", skills: "Digital Skills")

                controllerVM.addStudent(name: "Orapeleng", surname: "Sekoboane", gender: "M", dateOfBirth: "2012-12-03", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "6", school: "Levana Primary School", programme: "Numeracy", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Sivuyile", surname: "Khumalo", gender: "M", dateOfBirth: "2009-11-01", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "9", school: "Tembisa High School", programme: "#Myfuture", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Gift", surname: "Nkoana", gender: "M", dateOfBirth: "2011-04-07", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "Autistic spectrum disorder", identityNumber: "", grade: "7", school: "Randburg Clinic School for Children with Autism", programme: "Inclusion", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Selina", surname: "Pasipavunda", gender: "F", dateOfBirth: "2017-12-31", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "R", school: "Emsengeni Primary School", programme: "Early Learning", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Yanela", surname: "Ndhlovu", gender: "F", dateOfBirth: "2006-12-02", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "12", school: "Tembisa High School", programme: "#Myfuture", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Nonhle", surname: "Omarjee", gender: "F", dateOfBirth: "2008-08-26", nationality: "South Africa", city: "Mokgalaneng", address: "Naledi Section", language: "English, Sepedi, Swazi", specialNeeds: "Attention deficit disorder", identityNumber: "7717075960739", grade: "10", school: "Gaopotlake High School", programme: "#Myfuture", referenceContact: "000000", province: "North West", skills: "Digital skills, Collaboration")

                controllerVM.addStudent(name: "Lentswe", surname: "Cassiem", gender: "M", dateOfBirth: "2007-05-22", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "11", school: "Tembisa High School", programme: "#Myfuture", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Hulisani", surname: "Ndhlovu", gender: "F", dateOfBirth: "2015-09-05", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "3", school: "Clarence Primary School", programme: "Numeracy", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Uzair", surname: "Mainole", gender: "M", dateOfBirth: "2018-03-13", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "R", school: "Emsengeni Primary School", programme: "Early Learning", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Lindo", surname: "Shamamba", gender: "M", dateOfBirth: "2017-03-25", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "1", school: "Levana Primary School", programme: "Numeracy", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Linda", surname: "Medupe", gender: "F", dateOfBirth: "2009-08-10", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "9", school: "Sozama High School", programme: "#Myfuture", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Siphelo", surname: "Maqekoane", gender: "M", dateOfBirth: "2008-12-20", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "10", school: "Gaopotlake High School", programme: "#Myfuture", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Otlotleng", surname: "Ndlovu", gender: "M", dateOfBirth: "2007-01-29", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "11", school: "Gaopotlake High School", programme: "#Myfuture", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Maite", surname: "Mfati", gender: "F", dateOfBirth: "2008-05-17", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "10", school: "Sozama High School", programme: "#Myfuture", referenceContact: "", province: "", skills: "")

                controllerVM.addStudent(name: "Patrick", surname: "Onkabetse", gender: "M", dateOfBirth: "2018-01-23", nationality: "South Africa", city: "", address: "", language: "", specialNeeds: "", identityNumber: "", grade: "R", school: "Emsengeni Primary School", programme: "Early Learning", referenceContact: "", province: "", skills: "")

                studentViewModel.isTheFirstTime = true
            }
            controllerVM.fetchStudents()
        }
    }
    private func deleteStudent(at offsets: IndexSet ) {
        for offset in offsets {
            let student = studentViewModel.students[offset]
            guard let primaryKey = student.primaryKey else {
                print("ERROR: Primary key is nil.")
                break
            }
            Task {
                await studentViewModel.deleteStudent(studentPrimaryKey: primaryKey)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
