//
//  LoginViewController.swift
//  UnitTesting
//
//  Created by Ben Erekson on 12/5/21.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var usernameTextFeild: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var LoginButton: UIButton!
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func LoginButtonTapped(_ sender: Any) {
        let credentials = Credentials(username: usernameTextFeild.text, password: passwordTextField.text)
        CredentialsController.shared.validateCredentials(credentials: credentials) { result in
            switch result {
            case .success(_):
                print("Sucessfully logged into \(credentials.username ?? "account")")
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let okay = UIAlertAction(title: "Okay", style: .default)
                alert.addAction(okay)
                DispatchQueue.main.async {
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
}
