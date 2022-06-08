//
//  ViewController.swift
//  UIKit3homeTaskAlert
//
//  Created by Валентин Коскин on 07.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var addingLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - 1.Написать свое мини приложение на первом экране две кнопки "сложение" и "угадай число"  2. При попадании на этот экран запрашивать ФИО через алер и отображать в UILabel
    override func viewDidAppear(_ animated: Bool) {
        self.helloLabel.text = "Hello, "
        self.alertTitle(title: "Attention!", message: "Enter your name", style: .alert)
    }

    @IBAction func addingButton(_ sender: UIButton) {
        summaAlert(title: "It is sum app", message: "Enter two nums", style: .alert)
    }
    
    @IBAction func guessButton(_ sender: UIButton) {
        guessAlert(title: "Would you play?", message: "Enter number from 0 til 3", style: .alert)
    }
    // создаем функцию alertTitle(окошко), которую можем вызвать где угодно
    func alertTitle(title: String, message: String, style: UIAlertController.Style) {
        // создание окошка
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // добавляем поле "ОК", чтобы закрыть окошко
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            // сохраняем введенный текст
            let text = alertContoller.textFields?[0]
            // добавляем введенный текст к лэйблу
            self.helloLabel.text! += (text?.text)!
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel)
        // добавляем поле для ввода в  textField
        alertContoller.addTextField { (textField) in
            
        }
        // добавляем кнопку ОК
        alertContoller.addAction(action)
        // добавляем кнопку отмены
        alertContoller.addAction(actionCancel)
        //вызываем само сообщение
        self.present(alertContoller, animated: true, completion: nil)
    }
    //MARK: - 3. По нажатию на "сложение" открывать Алерт который просит ввести число 1 и число 2 и кнопка посчитать выводит результат в любом виде юзеру
    //создаем функцию(алерт) для ввода 2 значения и их сложеня
    func summaAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            let text1 = alertContoller.textFields?.first
            let text2 = alertContoller.textFields?[1]
            self.addingLabel.text! = String(Int(text1?.text ?? "0")! + Int(text2?.text ?? "0")!)
        }
        alertContoller.addAction(action)
        alertContoller.addTextField { (textField1) in
        }
        alertContoller.addTextField { (textField2) in
        }
        self.present(alertContoller, animated: true, completion: nil)
    }
    
    func guessAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "ok", style: .default) { (action) in
            let randomNum = Int.random(in: 0...3)
            let text = alertContoller.textFields?.first
            if randomNum == Int(text?.text ?? "0") {
                self.guessLabel.text = "You are win!"
            }
            else {
                self.guessLabel.text = "You are lose"
            }
        }
        alertContoller.addAction(action)
        alertContoller.addTextField { (textField) in
        }
        self.present(alertContoller, animated: true, completion: nil)
    }
}

