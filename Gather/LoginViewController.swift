//
//  LoginViewController.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/26/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        usernameField.delegate = self
        passwordField.delegate = self

        //usernameField.becomeFirstResponder()
        //passwordField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
      usernameField.resignFirstResponder()
    passwordField.resignFirstResponder()
      return true
    }
    
    
    @IBAction func onLogIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
              print("user", user!)
              self.performSegue(withIdentifier: "tabSegue", sender: nil)
          } else {
              print("Error: \(String(describing: error?.localizedDescription))")
          }
        }
    }
    
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
