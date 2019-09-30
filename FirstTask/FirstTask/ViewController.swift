//
//  ViewController.swift
//  FirstTask
//
//  Created by IJ . on 30/09/2019.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var soptButton: UIButton!
    @IBOutlet weak var anythingImageView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    let heartImage : UIImage = UIImage(named: "fullHeart.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.soptButton
        self.title = "Soptstargram"
    }

    @IBAction func touchHeartButton(_ sender: Any) {
        
        self.heartButton.setImage(heartImage, for: UIControl.State.normal)
        
        self.heartButton.setTitle("님이 좋아합니다.", for: UIControl.State.normal)
        
    }
    
}

