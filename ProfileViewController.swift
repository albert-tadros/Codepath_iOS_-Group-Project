//
//  ProfileViewController.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/16/22.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var profileTableView: UITableView!
    
    var userName = ""
    var professionalTitle = ""
    var email = ""
    var phoneNumber = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        self.loadUserData()
        
        self.profileTableView.reloadData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self
        self.loadUserData()
        print("inside View Did apear")
        //self.profileTableView.reloadData()
        
    }
    
    func loadUserData() {
        let authorId = PFUser.current()!.objectId
        print("author", authorId!)
        let query = PFQuery(className: "_User")
        query.whereKey("objectId", equalTo: authorId!)
        query.getObjectInBackground(withId: authorId!) { (user:PFObject?, error:Error?) in
            if let error = error {
                print("can't find object", error.localizedDescription)
            } else if let user = user {
                let firstname = user["firstname"] as! String
                let lastname = user["lastname"] as! String
                self.userName = firstname + " " + lastname
                self.professionalTitle = user["professional_title"] as! String
                self.email = user["email"] as! String
                self.phoneNumber = user["phone_number"] as! String
                self.profileTableView.reloadData()
                }
            }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // the entire view is one section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // for the two cells in the view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { // at ProfileImageCell
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileImage", for: indexPath) as! ProfileImageCell
            cell.nameTagLabel.text = "Name"
            cell.userNameLabel.text = userName
            return cell
        }else {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileInfo", for: indexPath) as! ProfileInfoCell
        
        cell.professionalTitleTagLabel.text = "Professional Title"
        cell.userProfessionalTitleLabel.text = professionalTitle
        
        cell.emailTagLabel.text = "Email"
        cell.userEmailLabel.text = email
        
        cell.phoneNumTagLabel.text = "Phone Number"
        cell.userPhoneNumLabel.text = phoneNumber
        
        return cell
        }
    }
    

}
