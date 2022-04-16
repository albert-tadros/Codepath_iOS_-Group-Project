//
//  EditProfileViewController.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/16/22.
//

import UIKit
import Parse

class EditProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var editTableView: UITableView!
    
    var userName = ""
    var professionalTitle = ""
    var email = ""
    var phoneNumber = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTableView.delegate = self
        editTableView.dataSource = self
        
        let user = PFUser.current()!
        let firstname = user["firstname"] as! String
        let lastname = user["lastname"] as! String
        userName = firstname + " " + lastname
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // the entire view is one section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // for the two cells in the view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { // at ProfileImageCell
        let cell = editTableView.dequeueReusableCell(withIdentifier: "editProfileImage", for: indexPath) as! EditProfileImageCell
            cell.nameTagLabel.text = "Name"
            cell.userNameLabel.text = userName
            return cell
        }else {
        let cell = editTableView.dequeueReusableCell(withIdentifier: "editProfileInfo", for: indexPath) as! EditProfileInfoCell
        
            cell.professionalTitleTagLabel.text = "Professional Title"
            cell.emailTagLabel.text = "Email"
            cell.phoneNumTagLabel.text = "Phone Number"
        
        return cell
        }
    }
    

    
    
    @IBAction func onSave(_ sender: Any) {
        
        let newTitle = EditProfileInfoCell.userProfessionalTitle
        let newEmail = EditProfileInfoCell.userEmail
        let newPhoneNum = EditProfileInfoCell.userPhoneNum
    
//        print("Now in onSave: new title is \(EditProfileInfoCell.userProfessionalTitle)")
//        print("Now in onSave: new Email is \(EditProfileInfoCell.userEmail)")
//        print("Now in onSave: new Phone Number is \(EditProfileInfoCell.userPhoneNum)")
        
        let authorId = PFUser.current()!.objectId
        print("author", authorId!)
        let query = PFQuery(className: "_User")
        query.whereKey("objectId", equalTo: authorId!)
        
        query.getObjectInBackground(withId: authorId!) { (user:PFObject?, error:Error?) in
            if let error = error {
                print("can't find object", error.localizedDescription)
            } else if let user = user {
                user["professional_title"] = newTitle
                user["email"] = newEmail
                user["phone_number"] = newPhoneNum
                user.saveInBackground { (success, error) in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                        print("Profile Updated")
                    }else {
                        print("Cannot Save Profile Updates")
                    }
                }
            }
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
