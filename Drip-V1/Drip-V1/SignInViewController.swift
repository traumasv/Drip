//
//  SignInViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 11/9/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//
import FirebaseAuth
import UIKit
class SignInViewController: UIViewController {
    



    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign In"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30),NSAttributedString.Key.foregroundColor: UIColor.black,]
       
        
    }
    

   
    @IBAction func signInPressed(_ sender: Any) {
    
    
    let password = self.passwordTextField.text
        
        let email = self.emailTextField.text
       
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            //print("hello");
            if error == nil{
                    //let order = Order.getInstance()
                    //order.getFromDataBase()
                
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeView")
                        self.show(vc!, sender: nil)
            }
                else {
                    print("\(email) wrong email")
                return}
            

            
        }
        
        
    }
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
