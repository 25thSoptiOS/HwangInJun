//
//  ViewController.swift
//  helloWorld
//
//  Created by IJ . on 28/09/2019.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fistLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNextView(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController
            else {
                return
        }
        //인스턴트 뷰 컨트롤러에 let 안붙이면 에러
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @IBAction func goNext(_ sender: Any) {
        self.fistLabel.text="SOPT !!"
        
    }
    
}

