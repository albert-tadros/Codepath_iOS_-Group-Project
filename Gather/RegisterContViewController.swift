//
//  RegisterContViewController.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/14/22.
//

import UIKit
import Parse

class RegisterContViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var accountTypeField: UITextField!
    @IBOutlet weak var teamField: UITextField!
    @IBOutlet weak var professionalTitleField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    
    let teams = ["Engineering" , "Marketing", "Human Resources"]
    let accountTypes = ["Managerial", "Non-Managerial"]
    var accountTypePickerView = UIPickerView()
    var teamPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamPickerView.delegate = self
        teamPickerView.dataSource = self
        accountTypePickerView.delegate = self
        accountTypePickerView.dataSource = self
        
        
        teamField.inputView = teamPickerView
        accountTypeField.inputView = accountTypePickerView
        
        // tags make distinction between each pickerview of the same view controller
        teamPickerView.tag = 1
        accountTypePickerView.tag = 2
    
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return teams.count
        case 2:
            return accountTypes.count
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1:
            return teams[row]
        case 2:
            return accountTypes[row]
        default:
            return "Data Not Found"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 1:
            teamField.becomeFirstResponder()
            teamField.text = teams[row]
            teamField.resignFirstResponder()
        case 2:
            accountTypeField.becomeFirstResponder()
            accountTypeField.text = accountTypes[row]
            accountTypeField.resignFirstResponder()
        default:
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onRegisterSubmit(_ sender: Any) {
        
        let user = PFUser()
        
        user["firstname"] = RegisterViewController.firstname
        user["lastname"] = RegisterViewController.lastname
        user.username = RegisterViewController.username
        user.password = RegisterViewController.password
        user.email = emailField.text!
        user["phone_number"] = phoneNumberField.text!
        user["team"] = teamField.text!
        user["professional_title"] = professionalTitleField.text!
        user["account_type"] = accountTypeField.text!
        
        
        user.signUpInBackground { (success, error) in
            if success {
                // add the user to a role
                // check if the entered role is already created in backend
                // if yes, just add user to the role
                let roleQuery = PFQuery(className:"_Role")
                roleQuery.whereKey("name", equalTo: self.accountTypeField.text!)
                roleQuery.findObjectsInBackground { (role, error) in
                    if role?.first != nil {
                        let user = PFUser.current()!
                        let roleObj = role!.first! as! PFRole
                        roleObj.users.add(user)
                        roleObj.saveInBackground { (success, error) in
                            if success {
                                print("user has been added to the role")
                            }else {
                                print("Can not add the user to role")
                            }
                        }
                    }else { // if is no role with given name, create it and add user to it
                        let role = PFRole()
                        let myAcl = PFACL()
                        myAcl.hasPublicReadAccess = true
                        myAcl.hasPublicWriteAccess = true
                        role.acl = myAcl
                        role.name = self.accountTypeField.text!
                        let user = PFUser.current()!
                        role.users.add(user)
                        role.saveInBackground { (success, error) in
                            if success {
                                print("Role has been added")
                            }else {
                                print("Can not add a role")
                            }
                        }
                    }
                }

                // handling UI naviagtion after registering
                let main = UIStoryboard(name: "Main", bundle: nil)
                let intialScreenController = main.instantiateViewController(withIdentifier: "initialScreen")
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
                let window = delegate.window
                window?.rootViewController = intialScreenController // set the current app window to the loginviewController, after registering
            }else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
            }
        }
}
