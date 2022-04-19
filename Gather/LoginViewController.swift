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
    
    
    let group = DispatchGroup()
    
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
    
    func loadUserData() {
        self.group.enter()
        let authorId = PFUser.current()!.objectId
        let query = PFQuery(className: "_User")
        query.whereKey("objectId", equalTo: authorId!)
        query.getObjectInBackground(withId: authorId!) { (user:PFObject?, error:Error?) in
            if let error = error {
                print("can't find object", error.localizedDescription)
            } else if let user = user {
                guard (user["profile_image"] as? PFFileObject) == nil else {
                    ProfileViewController.userData = user  as! PFUser
                    EditProfileViewController.userData = user as! PFUser
                    self.group.leave()
                    return
                }
                // if first time logging in, add the default image to the user
                    let defaultUserImage = UIImage(named: "icons8-customer-50")
                    let imageData = defaultUserImage?.pngData() // retrieve scaled image to original resolution and format as png
                    let file = PFFileObject(data: imageData!)
                    // image column
                    user["profile_image"] = file
                    user.saveInBackground { (success,error) in
                        if success {
                            print("default profile image Saved!")
                            ProfileViewController.userData = user  as! PFUser
                            EditProfileViewController.userData = user as! PFUser
                            self.group.leave()
                        }
                        if error != nil{
                            print("Error saving default profile image for user")
                        }
                    }
            }
        }
    }
    
    
    @IBAction func onLogIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
              print("user", user!)
              self.loadUserData()
              self.group.notify(queue: .main, execute: {
                  print("inside loginViewCont. User is:", ProfileViewController.userData)
                  self.performSegue(withIdentifier: "tabSegue", sender: nil)
              })
          } else {
              print("Error: \(String(describing: error?.localizedDescription))")
          }
        }
    }
    
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
