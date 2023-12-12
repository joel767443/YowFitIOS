//
//  AppService.swift
//  YoFit
//
//  Created by macos on 2023/12/12.
//

import Foundation

class UserService {
    
    
    struct User: Codable {
        var name: String?
        var email: String
        var password: String
    }
    
    struct UserResponse: Decodable {
        let status: Bool
        let message: String
        let token: String?
    }
    
    enum APIError: Error {
        case invalidResponse
        case httpRequestFailed(Error)
    }
    
    func createUser(name: String, password: String, email: String) async throws -> UserResponse {
        let user = User(name: name, email: email, password: password)
        let request = try makeApiCall(user: user, path: "register")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
            return userResponse
        } catch {
            throw APIError.httpRequestFailed(error)
        }
    }
    
    func login(password: String, email: String) async throws -> UserResponse {
        let user = User(email: email, password: password)
        let request = try makeApiCall(user: user, path: "login")

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
            return userResponse
        } catch {
            throw APIError.httpRequestFailed(error)
        }
    }
    
    func logout() async throws -> Bool {
        return true
    }
    
    func makeApiCall(user: User, path: String) throws -> URLRequest {
        let url = URL(string: "https://2000-197-95-180-203.ngrok-free.app/api/\(path)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonData = try JSONEncoder().encode(user)
        request.httpBody = jsonData

        return request
    }
}
