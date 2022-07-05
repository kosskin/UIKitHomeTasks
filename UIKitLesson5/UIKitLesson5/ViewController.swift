//
//  ViewController.swift
//  UIKitLesson5
//
//  Created by Валентин Коскин on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {

//    let picker = UIPickerView()
        let dataPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataPicker.center = view.center
//        picker.center = view.center
        dataPicker.datePickerMode = .date
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        
        let todayDate = Date()
        
        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        let twoYeatFromToday = todayDate.addingTimeInterval(2 * oneYearTime)
        
        dataPicker.minimumDate = oneYearFromToday
        dataPicker.maximumDate = twoYeatFromToday
        
        //protocol
//        picker.dataSource = self
//        picker.delegate = self
        
        
        self.view.addSubview(dataPicker)
//        self.view.addSubview(picker)
        
        dataPicker.addTarget(self, action: #selector(dataPickerChange(paramdatePicker:)), for: .valueChanged)
    }

    @objc func dataPickerChange(paramdatePicker: UIDatePicker) {
        if paramdatePicker.isEqual(self.dataPicker) {
            print("dateChange : = ", paramdatePicker.date)
        }
    }

}

//extension ViewController: UIPickerViewDataSource {
//    // сколько компонентов вывести
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    // сколько строк в компоненте
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 10
//    }
//}
//
//extension ViewController: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let result = "row = \(row)"
//        return result
//    }
//}
