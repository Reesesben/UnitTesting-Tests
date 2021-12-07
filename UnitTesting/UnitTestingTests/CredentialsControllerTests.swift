//
//  CredentialsControllerTests.swift
//  UnitTestingTests
//
//  Created by Ben Erekson on 12/5/21.
//

import XCTest
@testable import UnitTesting

class CredentialsControllerTests: XCTestCase {
    
    //MARK: - Lifecycles
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //MARK: - Test Cases
    func test_is_valid_credentails() throws {
        let credentials = Credentials(username: "Reesesben", password: "1234")
        var sucess = false
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(let didSuceed):
                sucess = didSuceed
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            XCTAssert(sucess)
        }
    }
    
    func test_invalid_password() throws {
        let credentials = Credentials(username: "Reesesben", password: "1235")
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.IncorrectPassword)
        }
    }
    
    func test_invalid_username() throws {
        let credentials = Credentials(username: "Reesesbens", password: "1234")
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.IncorrectUsername)
        }
    }
    
    func test_short_password() throws {
        let credentials = Credentials(username: "Reesesben", password: "12")
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.PasswordShort)
        }
    }
    
    func test_short_username() throws {
        let credentials = Credentials(username: "Re", password: "1234")
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.UsernameShort)
        }
    }
    
    func test_long_password() throws {
        let credentials = Credentials(username: "Reesesben", password: "123456789123456789123")
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.PasswordLong)
        }
    }
    
    func test_long_username() throws {
        let credentials = Credentials(username: "Reesesbenasdfasdfasdfasdfasdf", password: "1234")
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.UsernameLong)
        }
    }
    
    func test_nil_password() throws {
        let credentials = Credentials(username: "Reesesben", password: nil)
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.nilPassword)
        }
    }
    
    func test_nil_username() throws {
        let credentials = Credentials(username: nil, password: "1234")
        var thrownError: AuthenticationError?
        
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                //Shouldn't run
                print("Logged into user account")
            case .failure(let error):
                thrownError = error
            }
            
            XCTAssertEqual(thrownError, AuthenticationError.nilUsername)
        }
    }
    
    func test_time_to_validate() throws {
        measure {
            let credentials = Credentials(username: "Reesesben", password: "1234")
            var sucess = false
            
            CredentialsController.shared.validateCredentials(credentials: credentials) { result in
                switch result {
                case .success(let didSuceed):
                    sucess = didSuceed
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
                XCTAssertTrue(sucess)
            }
        }
    }
    
}
