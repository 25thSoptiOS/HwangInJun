//
//  ViewController.swift
//  SecondSeminaStackView
//
//  Created by IJ . on 2019/10/12.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        //패턴 이미지 안되면 밑 소스로 

        
       // view1.backgroundColor = UIColor.init(patternImage: UIImage(named: "bgImage")!)
        
        self.loginButton.layer.cornerRadius = 15
        self.loginButton.layer.borderColor = UIColor.black.cgColor
        self.loginButton.layer.borderWidth = 1.0
        
        
        
//        myTextView.layer.borderWidth = 1.0
//
//        myTextView.layer.borderColor = UIColor.black.cgColor


        
        
    }


}

