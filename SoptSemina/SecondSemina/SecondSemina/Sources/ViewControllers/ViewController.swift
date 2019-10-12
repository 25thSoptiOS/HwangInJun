//
//  ViewController.swift
//  SecondSemina
//
//  Created by IJ . on 2019/10/12.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var pinkButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let destination = segue.destination
        let button = sender as! UIButton
        destination.title = button.titleLabel?.text
          
        if( destination.title == "녹 색"){
                  destination.view.backgroundColor = UIColor.green
            } else {
                destination.view.backgroundColor = UIColor.systemPink
          }
        
        
    }

}

