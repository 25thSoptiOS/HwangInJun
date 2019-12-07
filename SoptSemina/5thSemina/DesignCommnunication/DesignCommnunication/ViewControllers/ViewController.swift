//
//  ViewController.swift
//  DesignCommnunication
//
//  Created by IJ . on 2019/11/16.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var homePremiumButton: UIButton!
    @IBOutlet weak var homeBetterButton: UIButton!
    @IBOutlet weak var homeGeneralButton: UIButton!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var arriveLabel: UILabel!
    @IBOutlet weak var PickerButton: UIButton!
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        //        formatter.dateStyle = .medium
        //        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy/MM/dd"
        //정해진 양식이 아닌 내가 지정한 포맷
        return formatter
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        allButton.layer.cornerRadius = allButton.bounds.height / 2
        //allButton.layer.borderColor = UIColor.black.cgColor //UIColor.init(red: 218, green: 240, blue: 252, alpha: 15) as! CGColor
        //궁금증 UIColor 코드로 주기
        homePremiumButton.layer.cornerRadius = homePremiumButton.bounds.height / 2
        homeBetterButton.layer.cornerRadius = homeBetterButton.bounds.height / 2
        homeGeneralButton.layer.cornerRadius = homeGeneralButton.bounds.height / 2
        
    }
    @IBAction func TouchPickerButton(_ sender: UIButton) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
        alert.view.addSubview(datePicker)
        
        
        
        
        let ok = UIAlertAction(title: "OK", style: .default) { (action) in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy. MM. dd"
            let dateString = dateFormatter.string(from: datePicker.date)
            print(dateString)
            self.dateLabel.text = dateString
        }
        
        let cancel = UIAlertAction(title: "CANCEL", style: .destructive, handler: nil)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func touchAllButton(_ sender: Any) {
        if self.allButton.isSelected == false {
            self.allButton.isSelected = true
        }
        else {
            self.allButton.isSelected = false
         //   allButton.backgroundColor = UIColor.blue
        }
    }
    
    @IBAction func touchHomePremiumButton(_ sender: Any) {
        if self.homePremiumButton.isSelected == false {
            self.homePremiumButton.isSelected = true
        }
        else {
            self.homePremiumButton.isSelected = false
        }
    }
    
    @IBAction func touchHomeBetterButton(_ sender: Any) {
        if self.homeBetterButton.isSelected == false {
            self.homeBetterButton.isSelected = true
        }
        else {
            self.homeBetterButton.isSelected = false
        }
    }
    
    @IBAction func touchHomeButton(_ sender: Any) {
        
        if self.homeGeneralButton.isSelected == false {
            self.homeGeneralButton.isSelected = true
        }
        else {
            self.homeGeneralButton.isSelected = false
        }
    }
    
    @IBAction func touchReserveButton(_ sender: Any) {
        
        
        //        guard let qId = questionTextField.text else {return}
        //              guard let userId = useridTextField.text else {return}
        //              guard let content = contentTextView.text else {return}
        
        print("예약 버튼 클릭")
        
        
        guard let reserveData = dateLabel.text else {return}
        let homeButtonIndex = 3
        guard let start = startLabel.text else {
            return
        }
        
        guard let arrive = arriveLabel.text else { return  }
        
        let way = 1
        
        let depart = start
        let date = dateLabel.text ?? "asdf"
        let people : Int = 2
        
        let grade = 3
        
        print("변수 까지 체크")
        
        let inqueryReservationRequest = InqueryReservationRequest(way: way, depart: depart, arrive: arrive, date: date, people: people, grade: grade)
        
        
        
            DataPost.shared.postDataList(with: inqueryReservationRequest) {
            
            responseData in
            
            switch responseData{
                
            case .success(let data) :
                
                //                let user_data = data as! ReceiveData
                //
                //                UserDefaults.standard.set(user_data.qId, forKey: "qId")
                //                UserDefaults.standard.set(user_data.userid, forKey: "userid")
                //                UserDefaults.standard.set(user_data.content, forKey: "content")
                
                print("데이터 받기 성공")
                print(data)
                
                
                
                
                
                
                
                
            case .failure(let Err) :
                print("실패")
                print(Err.localizedDescription)
                
            }
            
            
        }
        
        
    }
    
    
}

