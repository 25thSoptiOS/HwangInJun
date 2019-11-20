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
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var stackViewCenterY: NSLayoutConstraint!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewDidTap(_:)))
        view.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view.
        
        
        
        
        //패턴 이미지 안되면 밑 소스로 
        
        
        // view1.backgroundColor = UIColor.init(patternImage: UIImage(named: "bgImage")!)
        
        
        
        
        
        
        registerKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginButton.layer.cornerRadius = loginButton.bounds.height / 2
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 1.0
    }
    
    deinit {
        unregisterForKeyboardNotifications()
    }
    
    @IBAction func preseeLoginButton(_ sender: Any) {
        // 로그인 서버 통신 구현 코드
        guard let id = idTextField.text else { return }
        guard let pwd = pwTextField.text else { return }
        
        LoginService.shared.login(id, pwd) {
            data in
            
            switch data {
                
            case .success(let data):
                //userdefault 전역으로 데이터 저장소
                //다른 뷰컨에서도 접근 가능
                
                
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                
                // 사용자의 토큰, 이름, 이메일, 전화번호 받아오기
                // 비밀번호는 안 받아와도 됨
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.name, forKey: "name")
                UserDefaults.standard.set(user_data.phone, forKey: "phone")
                
                let story = UIStoryboard(name: "Main2", bundle: nil) //스토리보드 이름 고쳐야함
                let main = story.instantiateViewController(withIdentifier: "Main2")
                self.present(main, animated: true)
                
            case .requestErr(let message):
                print("로그인 실패 message: \(message)")
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print("로그인 실패 message: 네트워크 상태를 확인해주세요.")
            }
        }
    }
    

    
    @objc func viewDidTap(_ recognizer: UIGestureRecognizer) {
        
        idTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
    }
    
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight: CGFloat // 키보드의 높이
        
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        // animation 함수
        // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서
        // duration은 간격
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // self.loginView.alpha = 0
            
            // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
            self.stackViewCenterY.constant = -keyboardHeight/2 + 40
        })
        
        self.view.layoutIfNeeded()
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
        guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
        UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
            
            // 원래대로 돌아가도록
            // self.loginView.alpha = 1.0
            self.stackViewCenterY.constant = 0
        })
        
        self.view.layoutIfNeeded()
    }
    
}

// ---------------------------------------------------------------

/* / 키보드 때문에 가려지지 않게 조정하는 extension
 extension LoginVC: UIGestureRecognizerDelegate {
 
 func initGestureRecognizer() {
 let textFieldTap = UITapGestureRecognizer(target: self, action: #selector(handleTapTextField(_:)))
 textFieldTap.delegate = self
 view.addGestureRecognizer(textFieldTap)
 }
 
 // 다른 위치 탭했을 때 키보드 없어지는 코드
 @objc func handleTapTextField(_ sender: UITapGestureRecognizer) {
 self.loginUserid.resignFirstResponder()
 self.loginPassword.resignFirstResponder()
 }
 
 
 func gestureRecognizer(_ gestrueRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
 if (touch.view?.isDescendant(of: loginUserid))! || (touch.view?.isDescendant(of: loginPassword))! {
 
 return false
 }
 return true
 }
 
 // keyboard가 보여질 때 어떤 동작을 수행
 @objc func keyboardWillShow(_ notification: NSNotification) {
 
 guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
 guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else { return }
 
 guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
 
 let keyboardHeight: CGFloat // 키보드의 높이
 
 if #available(iOS 11.0, *) {
 keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
 } else {
 keyboardHeight = keyboardFrame.cgRectValue.height
 }
 
 // animation 함수
 // 최종 결과물 보여줄 상태만 선언해주면 애니메이션은 알아서
 // duration은 간격
 UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
 
 self.logoImgView.alpha = 0
 
 // +로 갈수록 y값이 내려가고 -로 갈수록 y값이 올라간다.
 self.stackViewCenterY.constant = -keyboardHeight/2 + 50
 })
 
 self.view.layoutIfNeeded()
 }
 
 // keyboard가 사라질 때 어떤 동작을 수행
 @objc func keyboardWillHide(_ notification: NSNotification) {
 guard let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {return}
 guard let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else {return}
 UIView.animate(withDuration: duration, delay: 0.0, options: .init(rawValue: curve), animations: {
 
 // 원래대로 돌아가도록
 self.logoImgView.alpha = 1.0
 self.stackViewCenterY.constant = 0
 })
 
 self.view.layoutIfNeeded()
 }
 
 
 // observer
 func registerForKeyboardNotifications() {
 NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
 NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
 }
 
 
 func unregisterForKeyboardNotifications() {
 NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
 NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
 }
 */


