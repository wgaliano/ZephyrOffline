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
                        ForEach(studentViewModel.students.sorted(by: { $0.names < $1.names }), id: \.self) { student in
                            if searchText.isEmpty ||
                                student.names.localizedCaseInsensitiveContains(searchText) ||
                                student.surname.localizedCaseInsensitiveContains(searchText) {
                                NavigationLink {
                                    StudentDetailView(student: student)
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
                    ForEach(studentViewModel.students.sorted(by: { $0.names < $1.names }), id: \.self) { student in
                        if searchText.isEmpty ||
                            student.names.localizedCaseInsensitiveContains(searchText) ||
                            student.surname.localizedCaseInsensitiveContains(searchText) {
                            NavigationLink {
                                StudentDetailView(student: student)
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
                    Task {
                        await studentViewModel.loadStudents()
                    }
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
            Task {
                await studentViewModel.loadStudents()
            }
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
