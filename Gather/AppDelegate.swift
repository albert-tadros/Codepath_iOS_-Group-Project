//
//  AppDelegate.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/22/22.
//

import UIKit
import Parse

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Parse.initialize(with: ParseClientConfiguration(block: { configuration in
            configuration.applicationId = APPLICATION_ID
            configuration.clientKey = CLIENT_KEY
            configuration.server = SERVER
        }))
        
//        let currentUser = PFUser.current()
//        if currentUser != nil {
//            let authorId = PFUser.current()!.objectId
//            let query = PFQuery(className: "_User")
//            query.whereKey("objectId", equalTo: authorId!)
//            query.getObjectInBackground(withId: authorId!) { (user:PFObject?, error:Error?) in
//                if let error = error {
//                    print("can't find object", error.localizedDescription)
//                } else if let user = user {
//                        // load the profile image
//                        let profileImageFile = user["profile_image"] as! PFFileObject
//                        let urlString = profileImageFile.url!
//                        let url = URL(string : urlString)
//                        print("in app delegate: imageURL", url!)
//                        ProfileViewController.imageURL = url
//                        EditProfileViewController.imageURL = url
//                    }
//                }
//        }
        return true
    }

        // Override point for customization after application launch.


    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

