//
//  CredentialsController.swift
//  UnitTesting
//
//  Created by Ben Erekson on 12/5/21.
//

import Foundation

class CredentialsController {
    //MARK: - Singleton
    static var shared = CredentialsController()
    
    //MARK: - Class Methods
    func validateCredentials(credentials: Credentials, completion: @escaping (Result<Bool, AuthenticationError>) -> Void) {
        guard let username = credentials.username else { return completion(.failure(.nilUsername))}
        guard let password = credentials.password else { return completion(.failure(.nilPassword))}
        
        if username.count < 3 {
            return completion(.failure(.UsernameShort))
        } else if username.count > 20 {
            return completion(.failure(.UsernameLong))
        } else if password.count < 3 {
            return completion(.failure(.PasswordShort))
        } else if password.count > 20 {
            return completion(.failure(.PasswordLong))
        } else if username == "Reesesben" && password == "1234" {
            return completion(.success(true))
        } else {
            if username != "Reesesben" {
                return completion(.failure(.IncorrectUsername))
            } else {
                return completion(.failure(.IncorrectPassword))
            }
        }
    }
}
