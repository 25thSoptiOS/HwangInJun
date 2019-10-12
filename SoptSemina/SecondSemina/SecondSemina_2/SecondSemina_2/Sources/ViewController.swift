//
//  ViewController.swift
//  SecondSemina_2
//
//  Created by IJ . on 2019/10/12.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var update: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    
    @IBOutlet weak var intervalLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interval.autorepeat = true
        interval.wraps = true
        interval.maximumValue = 20
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeValueStepper(_ sender: UIStepper) {
        
        intervalLabel.text = "\(Int(sender.value))분 마다"
        
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        guard let rvc=self.storyboard?.instantiateViewController(identifier: "RVC") as? ResultViewController else {
            return
        }
        
        rvc.paraEmail = self.emailText.text!
        rvc.paraUpdate = self.update.isOn
        rvc.paraInterval = self.interval.value
        
        self.present(rvc, animated: true)
        
    }
    

}

