//
//  ViewController.swift
//  TestApp1
//
//  Created by Nikolai Kim on 09.03.21.
//

import UIKit

class ViewControllerScreen176: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!

    // for the time being, only recognize one user/password, hardcode them for now and use
    // the strings at runtime to compare the text field input against
    var username = "nkim"
    var password = "mikn"

    //**************************************************************************
    // helper function for a fancier user interface. To indicate rejection,
    // provide the shaking functionality to animate the sender (e.g. the text
    // fields capturing user's login/password input)
    func shake(_ sender: UITextField) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        
        animation.timingFunction =
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        animation.duration = 0.6
        animation.values =
            [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0]

        sender.layer.add(animation, forKey: "shake")
    }
    
    //**************************************************************************
    // this is the callback invoked upon entering the text field for the pass-
    // word. In case the login name has changed, force the user to input the
    // password (since this is the main trigger for the next screen)
    @IBAction func usernameEdited() {
        textFieldPassword.text = ""
    }
    
    //**************************************************************************
    // the processing of the user data is triggered upon committing the user
    // password with the ENTER key
    @IBAction func passwordEntered() {
        if (textFieldUsername.text != username) {
            shake(textFieldUsername)
            
            let alert = UIAlertController(
                            title: "Invalid user",
                            message: "Specified login name does not exist",
                            preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(
                                title: "Ok",
                                style: UIAlertAction.Style.default,
                                handler: { _ in }))

            self.present(alert, animated: true, completion: nil)
            return
        }

        if (textFieldPassword.text != password) {
            shake(textFieldPassword)
        
            let alert = UIAlertController(
                            title: "Invalid password",
                            message: "Incorrect password entered for the user",
                            preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(
                                title: "Ok",
                                style: UIAlertAction.Style.default,
                                handler: { _ in }))
    
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // alignment inconsistencies with the safe area/background image
        performSegue(withIdentifier: "ID_segue_in_132", sender: nil)
    }
  
    //**************************************************************************
    // do any additional setup stuff upon loading the view
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

