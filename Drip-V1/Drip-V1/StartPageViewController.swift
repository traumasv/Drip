//
//  startPage.swift
//  Drip-V1
//
//  Created by William Pintas on 11/14/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//
import FirebaseAuth
import UIKit

class StartPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       
        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        //print("HELLO")
        //print("StartPage \(user?.email)")
        if(user != nil){
            let cc = self.storyboard?.instantiateViewController(withIdentifier: "homeView")
            self.present(cc!, animated: false, completion: nil)
            //DrinkSummaryViewController.init()
        }else{
            // Go to sign in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "signInAndSignUpVC")
            //self.show(vc!, sender: nil)
            self.present(vc!, animated: false, completion: nil)
        }
        
    }
    
    
    
}
}


