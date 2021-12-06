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
    
}
