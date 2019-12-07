//
//  ViewController.swift
//  Social Login
//
//  Created by IJ . on 2019/12/07.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let loginBtn = FBLoginButton()
        loginBtn.permissions = ["email"]
        loginBtn.center = view.center
        view.addSubview(loginBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAccessToken()
    }
    
    
    func getAccessToken() {
        guard let token = AccessToken.current else {return}
        print("### AccessToken ####")
        print(token)
        print("### AccessToken ####")
    }
    
    

}

