//
//  SceneDelegate.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/22/22.
//

import UIKit
import Parse

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let group = DispatchGroup()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        
        let currentUser = PFUser.current()
        // user stays loggined if user did not log out
        if currentUser != nil {
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
            let main = UIStoryboard(name: "Main", bundle: nil)
            let tabNavigiationController = main.instantiateViewController(withIdentifier: "TabNavigationController")
                self.window?.rootViewController = tabNavigiationController
        })
    }
}

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

