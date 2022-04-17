//
//  EditProfileInfoCell.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/16/22.
//

import UIKit

class EditProfileInfoCell: UITableViewCell, UITextFieldDelegate {
    
    
    @IBOutlet weak var professionalTitleTagLabel: UILabel!
    @IBOutlet weak var userProfessionalTitleField: UITextField!
    @IBOutlet weak var emailTagLabel: UILabel!
    @IBOutlet weak var userEmailField: UITextField!
    @IBOutlet weak var phoneNumTagLabel: UILabel!
    @IBOutlet weak var userPhoneNumField: UITextField!
    
    
    static var userProfessionalTitle = ""
    static var userEmail = ""
    static var userPhoneNum = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userProfessionalTitleField.delegate = self
        userEmailField.delegate = self
        userPhoneNumField.delegate = self
        userProfessionalTitleField.becomeFirstResponder()
        userEmailField.becomeFirstResponder()
        userPhoneNumField.becomeFirstResponder()
        // Initialization code
    }
    
    
    @IBAction func titleFieldChanged(_ sender: Any) {
        print("titleField is now: \(userProfessionalTitleField.text!)")
        EditProfileInfoCell.userProfessionalTitle = userProfessionalTitleField.text!
        print("userprofessionalTitle" , EditProfileInfoCell.userProfessionalTitle)
    }
    
    
    @IBAction func emailFieldChanged(_ sender: Any) {
        EditProfileInfoCell.userEmail = userEmailField.text!
        print("userEmail" , EditProfileInfoCell.userEmail)
    }
    
    
    @IBAction func phoneNumFieldChanged(_ sender: Any) {
        EditProfileInfoCell.userPhoneNum = userPhoneNumField.text!
        print("userPhoneNum" , EditProfileInfoCell.userPhoneNum)
    }
    
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
//
//        userProfessionalTitleField.resignFirstResponder()
//        userEmailField.resignFirstResponder()
//        userPhoneNumField.resignFirstResponder()
//      return true
//    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
