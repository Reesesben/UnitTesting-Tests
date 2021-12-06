//
//  AuthenticaitonError.swift
//  UnitTesting
//
//  Created by Ben Erekson on 12/5/21.
//

import Foundation

enum AuthenticationError: LocalizedError {
    case nilUsername
    case nilPassword
    case UsernameShort
    case PasswordShort
    case UsernameLong
    case PasswordLong
    case IncorrectUsername
    case IncorrectPassword
    
    var errorDescription: String? {
        switch self {
        case .nilUsername:
            return "Username section was left blank"
        case .nilPassword:
            return "Passwword section was left blank"
        case .UsernameShort:
            return "Inputed username was to short"
        case .PasswordShort:
            return "Inputed password was to short"
        case .UsernameLong:
            return "Inputed username was to long"
        case .PasswordLong:
            return "Inputed password was to long"
        case .IncorrectUsername:
            return "Inputed username was incorrect"
        case .IncorrectPassword:
            return "Inputed password was incorrect"
        }
    }
}
