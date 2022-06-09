//
//  ViewController.swift
//  RKKadai5
//
//  Created by kasai riku on 2022/06/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func calcButton(_ sender: Any) {
        enum AlertMessage: String {
            case firstTextFieldIsNil = "割られる数を入力して下さい"
            case secondTextFieldIsNil = "割る数を入力して下さい"
            case divededByZero = "割る数には0を入力しないで下さい"
        }
        let firstMessage = AlertMessage.firstTextFieldIsNil.rawValue
        let secondMessage = AlertMessage.secondTextFieldIsNil.rawValue
        let dividedMessage = AlertMessage.divededByZero.rawValue
        guard let firstValue = firstTextField.textToDouble else {
            return presentAlert(message: firstMessage)
        }
        guard let secondValue = secondTextField.textToDouble else {
            return presentAlert(message: secondMessage)
        }
        guard secondValue.isZero == false else {
            return presentAlert(message: dividedMessage)
        }
        resultLabel.text = String(firstValue / secondValue)
    }
    
    func presentAlert(message: String) {
        let alert = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
extension UITextField {
    var textToDouble: Double? {
        let text = self.text
        let double = text.flatMap { Double($0) }
        return double
    }
}
