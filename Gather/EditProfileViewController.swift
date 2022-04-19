//
//  EditProfileViewController.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/16/22.
//

import UIKit
import Parse
import AlamofireImage

class EditProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var editTableView: UITableView!
    
    
    static var userData = PFUser()
    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editTableView.delegate = self
        editTableView.dataSource = self
        
        }
    override func viewDidAppear(_ animated: Bool) {
        
        editTableView.delegate = self
        editTableView.dataSource = self
        self.editTableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // the entire view is one section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // for the two cells in the view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = EditProfileViewController.userData
        
        if indexPath.row == 0 { // at ProfileImageCell
        let cell = editTableView.dequeueReusableCell(withIdentifier: "editProfileImage", for: indexPath) as! EditProfileImageCell
            
            let firstname = user["firstname"] as! String
            let lastname = user["lastname"] as! String
            let userName = firstname + " " + lastname
            
            
            //self.group.notify(queue: .main, execute: {
                cell.nameTagLabel.text = "Name"
                cell.userNameLabel.text = userName
                
            let profileImageFile = user["profile_image"] as! PFFileObject
            let urlString = profileImageFile.url!
            let url = URL(string : urlString)
                cell.profileImageView.layer.cornerRadius = cell.profileImageView.bounds.width / 2
                cell.profileImageView.af.setImage(withURL: url!)
            //})
            return cell
        }else {
        let cell = editTableView.dequeueReusableCell(withIdentifier: "editProfileInfo", for: indexPath) as! EditProfileInfoCell
            
            self.group.notify(queue: .main, execute: {
                cell.professionalTitleTagLabel.text = "Professional Title"
                cell.userProfessionalTitleField.text = user["professional_title"] as? String
                cell.userProfessionalTitleField.becomeFirstResponder()
            
                cell.emailTagLabel.text = "Email"
                cell.userEmailField.text = user["email"] as? String
            
                cell.phoneNumTagLabel.text = "Phone Number"
                cell.userPhoneNumField.text = user["phone_number"] as? String
            })
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
                
                
                if newTitle != "" {
                    user["professional_title"] = newTitle
                }else {
                    user["professional_title"] = user["professional_title"] as? String
                }
                if newEmail != ""  {
                    user["email"] = newEmail
                }else {
                    user["email"] = user["email"] as? String
                }
                if newPhoneNum != "" {
                    user["phone_number"] = newPhoneNum
                }else {
                    user["phone_number"] = user["phone_number"] as? String
                }
                user.saveInBackground { (success, error) in
                    if success {
                        self.group.enter()
                        let authorId = PFUser.current()!.objectId
                        let query = PFQuery(className: "_User")
                        query.whereKey("objectId", equalTo: authorId!)
                        query.getObjectInBackground(withId: authorId!) { (user:PFObject?, error:Error?) in
                            if let error = error {
                                print("can't find object", error.localizedDescription)
                            } else if let user = user {
                                ProfileViewController.userData = user  as! PFUser
                                EditProfileViewController.userData = user as! PFUser
                                    self.group.leave()
                                }
                        }
                        self.group.notify(queue: .main, execute: {
                            self.dismiss(animated: true, completion: nil)
                            print("Profile Updated")
                    })
                        
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
