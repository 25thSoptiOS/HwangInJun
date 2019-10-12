//
//  ResultViewController.swift
//  SecondSemina_2
//
//  Created by IJ . on 2019/10/12.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    @IBOutlet weak var intervalLabel: UILabel!
    
    
    var paraEmail: String = ""
    var paraUpdate: Bool = false
    var paraInterval: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.emailLabel.text = paraEmail
              self.updateLabel.text = (paraUpdate == true ? "자동갱신":"자동갱신안함")
              self.intervalLabel.text = "\(Int(paraInterval)) 분 마다 갱신"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
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
