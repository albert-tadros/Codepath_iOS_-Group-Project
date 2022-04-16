//
//  SignupViewController.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/26/22.
//

import UIKit
import Parse

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    static var firstname = ""
    static var lastname = ""
    static var username = ""
    static var password = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameField.delegate = self
        lastnameField.delegate = self
        usernameField.delegate = self
        passwordField.delegate = self
        //SecureField("Password", text: $passwordField)

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        firstnameField.resignFirstResponder()
        lastnameField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
      return true
    }

    
    @IBAction func onClickNext(_ sender: Any) {
        
        RegisterViewController.firstname = firstnameField.text!
        RegisterViewController.lastname = lastnameField.text!
        RegisterViewController.username = usernameField.text!
        RegisterViewController.password = passwordField.text!
        
        
//        let user = PFUser()
//        user["firstname"] = firstnameField.text
//        user["lastname"] = lastnameField.text
//        user.username = usernameField.text
//        user.password = passwordField.text
    }
    
    @IBAction func onCancelSignUp(_ sender: Any) {
        dismiss(animated: true)
    }

}
