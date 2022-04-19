//
//  ProfileImageUploadViewController.swift
//  Gather
//
//  Created by ALBERT TADROS on 4/18/22.
//

import UIKit
import Parse
import AlamofireImage

class UploadProfileImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let group = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitButton(_ sender: Any) {
        // create a new data table (i.e dictionary or classname called Posts) in Parse API
//        let user = PFObject(className: "User") // using a object
        let authorId = PFUser.current()!.objectId
        print("author", authorId!)
        let query = PFQuery(className: "_User")
        query.whereKey("objectId", equalTo: authorId!)
        query.getObjectInBackground(withId: authorId!) { (user:PFObject?, error:Error?) in
            if let error = error {
                print("can't find object", error.localizedDescription)
            } else if let user = user {
                let imageData = self.imageView.image?.pngData() // retrieve scaled image to original resolution and format as png
                let file = PFFileObject(data: imageData!)
                // image column
                user["profile_image"] = file
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
                            print("Profile Image Uploaded")
                        })
                    }else {
                        print("Error!")
                    }
                }
            }
        }
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
