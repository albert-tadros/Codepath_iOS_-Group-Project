//
//  ViewController.swift
//  Eftekad
//
//  Created by ALBERT TADROS on 3/22/22.
//

import UIKit
import SideMenu
import Parse

class ViewController: UIViewController , MenuControllerDelegate{
    
    private var sideMenu: SideMenuNavigationController?
    
    // navigate from menue to other viewControllers
    private let monthsViewController = HomeTableViewController()

    //private let LogoutView = LogoutViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenueController(with: ["Months" , "Logout"])
        menu.delegate = self
        
        // Do any additional setup after loading the view.
        sideMenu = SideMenuNavigationController(rootViewController:menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        addChildController() // to navigate from menue to other viewControllers
    }
    
    private func addChildController(){
        addChild(monthsViewController)

        view.addSubview(monthsViewController.view)

        //monthsViewController.view.frame = view.frame

        monthsViewController.didMove(toParent: self)
        monthsViewController.view.isHidden = true
    }
    
    
    @IBAction func TapMenu(_ sender: Any) {
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: String) {
        
        print("I am inside did select item menue")
        sideMenu?.dismiss(animated: true, completion: { [weak self] in
            //self?.title = named
            if named == "Months"{
                //self?.present(self!.monthsViewController, animated: true, completion: nil)
                self?.performSegue(withIdentifier: "ToHomeScreen", sender: self)
                //self?.monthsViewController.view.isHidden = false
            }
            if named == "Logout" {
                PFUser.logOut()
        //        PFUser.current()
                
                // we  can then dismiss the view which will return to the root of the  navigation in this  case
                //dismiss(animated: true, completion: nil)
                
                // or we can navigate to a specific page upon logging out action, as follows
                let main = UIStoryboard(name: "Main", bundle: nil)
                let initialScreenController = main.instantiateViewController(withIdentifier: "initialScreen")
                // this is to access the windows property of the scence delgate class:
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
                let window = delegate.window
                window?.rootViewController = initialScreenController // set the current app window to the loginviewController, after logging out
            }
        })
    }
}
