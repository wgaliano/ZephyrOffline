//
//  StudentData.swift
//  ZephyrTesting
//
//  Created by Вячеслав Горев on 7/9/2023.
//

import Foundation

struct StudentData {
    private let baseUrl = URL(string: "https://napoli.fm-testing.com/fmi/odata/v4/ZephyrTesting")!
    private let username = "Admin"
    private let password = "admin"

    private var basicAuthorizationHeader: String {
        let auth = "\(username):\(password)".data(using: .utf8)?.base64EncodedString() ?? ""
        return "Basic \(auth)"
    }

    /// Fetches all teams from 'Teams' table on FileMaker server using OData API
    /// - Returns: List of teams
    func fetchStudents() async throws -> [Student] {
        let url = baseUrl.appending(path: "Student")
        var request = URLRequest(url: url)
        request.setValue(basicAuthorizationHeader, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(FileMakerODataResponse<[Student]>.self, from: data)
        return response.value
    }
    
    func addNewStudent(newStudent: Student) async throws {
        let url = baseUrl.appending(path: "Student")
        var request = URLRequest(url: url)
        request.setValue(basicAuthorizationHeader, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let newStudentData = try JSONEncoder().encode(newStudent)

        request.httpBody = newStudentData

        let (data, _) = try await URLSession.shared.data(for: request )

        _ = try JSONDecoder().decode(Student.self, from: data)
    }

    func deleteStudent(studentPrimaryKey: String) async throws {
        let url = baseUrl.appending(path: "Student('\(studentPrimaryKey)')")
        print(url.absoluteString)
        var request = URLRequest(url: url)
        request.setValue(basicAuthorizationHeader, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "DELETE"

        let (data, _) = try await URLSession.shared.data(for: request )

        _ = try JSONDecoder().decode(Student.self, from: data)
    }

    func editRecord(_ updatedStudent: Student) async throws {
        guard let primaryKey = updatedStudent.primaryKey else {
            print("ERROR: Primary key is nil.")
            return
        }

        let url = baseUrl.appendingPathComponent("Student('\(primaryKey)')")
        var request = URLRequest(url: url)
        request.setValue(basicAuthorizationHeader, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "PATCH"

        let jsonData = try JSONEncoder().encode(updatedStudent)
        request.httpBody = jsonData

        let (data, _) = try await URLSession.shared.data(for: request )

        _ = try JSONDecoder().decode(Student.self, from: data)
    }
}
