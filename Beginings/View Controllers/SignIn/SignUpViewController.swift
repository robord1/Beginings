//
//  SignInViewController.swift
//  Beginings
//
//  Created by rob ord on 08/02/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        errorLabel.alpha = 0
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if  email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
        //    return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    

    
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        print("EMAIL:",email)
        print("PASSWORD", password)
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data

            let signUpEmail = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let signUpPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: signUpEmail, password: signUpPassword) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                    print("ERROR:")
                    print(err!)
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["signup date":Timestamp(),"email":self.email.text, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    //self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
//    func transitionToHome() {
//        
//        let homeViewController = storyboard?.instantiateViewController(identifier: "homeVC") as? InitialViewController
//        
//        view.window?.rootViewController = homeViewController
//        view.window?.makeKeyAndVisible()
//        
//    }
    
}
