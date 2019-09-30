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
    let emptyHeartImage : UIImage = UIImage(named: "emptyHeart.png")!
    let myImage : UIImage = UIImage(named: "Suisse")!
/*  image source https://www.freepik.com/premium-photo/zermatt-switzerland-matterhorn-ski-resort_5204832.htm
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.heartButton.setImage(heartImage, for: UIControl.State.selected)
        self.heartButton.setImage(emptyHeartImage, for: UIControl.State.normal)
        self.heartButton.setTitle("님이 좋아합니다.", for: UIControl.State.selected)
//        self.heartButton.setAttributedTitle("님이 좋아합니다.", for: UIControl.State.selected)
        self.title = "Soptstargram"
        self.anythingImageView.image = myImage
    }

    @IBAction func touchHeartButton(_ sender: Any) {
        

        if self.heartButton.isSelected == false {
            self.heartButton.isSelected = true
        }
        else {
            self.heartButton.isSelected = false
        }
        
        
    }
    
}

