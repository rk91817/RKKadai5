//
//  ViewController.swift
//  RKKadai5
//
//  Created by kasai riku on 2022/06/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var firstTextField: UITextField!
    @IBOutlet private weak var secondTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction func calcButton(_ sender: Any) {
        enum AlertMessage {
            static let firstTextFieldIsNil = "割られる数を入力して下さい"
            static let secondTextFieldIsNil = "割る数を入力して下さい"
            static let divededByZero = "割る数には0を入力しないで下さい"
        }

        guard let firstValue = firstTextField.textToDouble else {
            presentAlert(message: AlertMessage.firstTextFieldIsNil)
            return
        }

        guard let secondValue = secondTextField.textToDouble else {
            presentAlert(message: AlertMessage.secondTextFieldIsNil)
            return
        }

        guard secondValue.isZero == false else {
            presentAlert(message: AlertMessage.divededByZero)
            return
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
