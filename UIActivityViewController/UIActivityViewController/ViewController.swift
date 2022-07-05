//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by Валентин Коскин on 30.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var buttonShare = UIButton()
    var textField = UITextField()
    var activityViewController: UIActivityViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTextField()
        self.createButton()
    }

    // MARK: - Method
    func createTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 280, height: 30)
        self.textField.center = self.view.center
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        self.textField.placeholder = "Enter text to share"
        self.textField.delegate = self
        self.view.addSubview(textField)
    }
    
    func createButton() {
        self.buttonShare = UIButton(type: .roundedRect)
        self.buttonShare.frame = CGRect(x: 50, y: 350, width: 280, height: 44)
        self.buttonShare.setTitle("Share!", for: .normal)
        self.buttonShare.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        self.view.addSubview(buttonShare)
    }
    
    @objc func handleShare(paramSender: Any) {
        let text = self.textField.text
        if text?.count == 0 {
            let message = "You should write text"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        self.activityViewController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(self.activityViewController!, animated: true, completion: nil)
    }
    
    
    //MARK: -UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
}

