//
//  ViewController.swift
//  Calculator
//
//  Created by IJ . on 2019/10/25.
//  Copyright © 2019 jun. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    // TODO: 현재 모든 버튼에 대해서 하나의 액션 함수로 처리함. 숫자 / 연산자 / AC 총 세 개의 분류로 나누어서 리팩토링.
    

    @IBOutlet var calculatorButtons: [UIButton]!
    @IBOutlet weak var testLabel: UILabel!
    
    var isChecked = true
    var operationType: OperationType?
    var beforeValue: Int?
    var nowValue: Int? {
        didSet {
            testLabel.text = nowValue?.withComma ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in calculatorButtons {
//            button.layer.cornerRadius = button.bounds.height / 2
            button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for button in calculatorButtons {
            button.layer.cornerRadius = button.bounds.height / 2
//            button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        }
    }
    
    @objc func buttonDidTap(_ sender: UIButton) {
        guard let command = sender.titleLabel?.text else { return }
        if let operation = OperationType(rawValue: command) {
            // 연산자 또는 기호
            switch operation {
            case .plus:
                calculate(by: .plus)
                isChecked = false
            case .minus:
                calculate(by: .minus)
                isChecked = false
            case .multiply:
                calculate(by: .multiply)
                isChecked = false
            case .divide:
                calculate(by: .divide)
                isChecked = false
            case .result:
                guard let currentValue = nowValue else { return }
                guard let operationType = operationType else { return }
                if let beforeValue = beforeValue {
                    switch operationType {
                    case .plus:
                        self.nowValue = beforeValue + currentValue
                    case .minus:
                        self.nowValue = beforeValue - currentValue
                    case .multiply:
                        self.nowValue = beforeValue * currentValue
                    case .divide:
                        self.nowValue = beforeValue / currentValue
                    default:
                        break
                    }
                }
                beforeValue = nil
                self.operationType = nil
            case .initialize:
                operationType = nil
                nowValue = nil
                beforeValue = nil
            }
        } else {
            // 숫자
            if !isChecked {
                nowValue = nil
                isChecked = true
            }
            guard let number = Int(command) else { return }
            if let currentValue = nowValue {
                self.nowValue = currentValue * 10 + number
            } else {
                self.nowValue = number
            }
        }
    }
    
    func calculate(by operationType: OperationType) {
        guard let currentValue = nowValue else { return }
        if let beforeValue = beforeValue {
            switch operationType {
            case .plus:
                self.beforeValue = currentValue + beforeValue
            case .minus:
                self.beforeValue = currentValue - beforeValue
            case .multiply:
                self.beforeValue = currentValue * beforeValue
            case .divide:
                self.beforeValue = currentValue / beforeValue
            default:
                break
            }
        } else {
            self.beforeValue = currentValue
        }
        self.operationType = operationType
    }
}
