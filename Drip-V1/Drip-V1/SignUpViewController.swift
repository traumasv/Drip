//
//  SignUpViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 11/9/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//
import FirebaseAuth
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
         button.isEnabled = false
        
    }
    var pass = false
    var eml = false
    var nme = false
    var lstNm = false
    
  
    @IBAction func psswrd(_ sender: Any) {
    
    if(passwordTextField.text != ""){
            pass = true
        }
        else{
            pass = false
        }
        self.check()
    }
   

    
   
    @IBAction func first(_ sender: Any) {
        if(firstNameTextField.text != ""){
            nme = true
        }
        else{
            nme = false
        }
        self.check()
    }
    
    
   
    @IBAction func eml(_ sender: Any) {

    
    if(emailTextField.text != ""){
            eml = true
        }
        else{
            eml = false
        }
        self.check()
    }
    
    @IBAction func last(_ sender: Any) {
    
    if(lastNameTextField.text != ""){
            lstNm = true
        }
        else{
            lstNm = false
        }
        self.check()
    }
    
    func check(){
        if(lstNm && nme && eml && pass ){
            button.isEnabled = true
    }
        else{
            button.isEnabled = false
        }
    }
    @IBAction func signUp(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        
        // [START create_user]
        Auth.auth().createUser(withEmail: email!, password: password!) { (authResult, error) in
            // [START_EXCLUDE]

            if error == nil{
                authResult?.user.createProfileChangeRequest().displayName = "\(firstName!)"
               let new = false
                let order = Order.getInstance()
                order.name = firstName!

                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "addSomething")
                    self.present(vc!, animated: false, completion: nil)
            }
            
            else{
                
                print("\(email) Not created")
            }
            
            
            
        
        }
        // [END create_user]
    }
    
}






