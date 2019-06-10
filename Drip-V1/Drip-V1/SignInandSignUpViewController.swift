//
//  SignInandSignUpViewController.swift
//  Drip-V1
//
//  Created by William Pintas on 12/3/18.
//  Copyright © 2018 William Pintas. All rights reserved.
//

import UIKit

class SignInandSignUpViewController: UIViewController {

    override func viewDidLoad() {
        self.title = "back"
        //let blue = UIColor.init(red: 209.0/255, green: 235.0/255, blue: 255.0/255, alpha: 1)
       // view.backgroundColor = blue
        super.viewDidLoad()
    }
    
    @IBOutlet weak var dripLogo: UIImageView!
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
            
        
    }
   
   override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
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
