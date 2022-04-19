//
//  ProfileViewController.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/16/22.
//

import UIKit
import Parse
import AlamofireImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var profileTableView: UITableView!
    
    
    static var userData = PFUser()
    let group = DispatchGroup()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileTableView.delegate = self
        profileTableView.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self
        
        self.profileTableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // the entire view is one section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // for the two cells in the view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = ProfileViewController.userData
        
        if indexPath.row == 0 { // at ProfileImageCell
            let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileImage", for: indexPath) as! ProfileImageCell
            
            let firstname = user["firstname"] as! String
            let lastname = user["lastname"] as! String
            let userName = firstname + " " + lastname
            
                // view name tag and user first and last name
                cell.nameTagLabel.text = "Name"
                cell.userNameLabel.text = userName

                // view the user profile from database
                let profileImageFile = user["profile_image"] as! PFFileObject
                let urlString = profileImageFile.url!
                let url = URL(string : urlString)
                cell.profileImageView.clipsToBounds = true
                cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2
                cell.profileImageView.af.setImage(withURL: url!)
            return cell
            
        }else {
        let cell = profileTableView.dequeueReusableCell(withIdentifier: "profileInfo", for: indexPath) as! ProfileInfoCell
            
            cell.professionalTitleTagLabel.text = "Professional Title"
            cell.phoneNumTagLabel.text = "Phone Number"
            cell.emailTagLabel.text = "Email"
            
            let professionalTitle = user["professional_title"] as! String
            let email = user["email"] as! String
            let phoneNumber = user["phone_number"] as! String
            
            cell.userProfessionalTitleLabel.text = professionalTitle
            cell.userEmailLabel.text = email
            cell.userPhoneNumLabel.text = phoneNumber
 
        return cell
        }
    }
}
