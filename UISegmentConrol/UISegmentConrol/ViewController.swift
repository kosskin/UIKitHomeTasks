//
//  ViewController.swift
//  UISegmentConrol
//
//  Created by Валентин Коскин on 30.06.2022.
//

import UIKit

class ViewController: UIViewController {

    var segmentedControl = UISegmentedControl()
    var imageView = UIImageView()
    
    var menuArray = ["one", "two", "three"]
    let imageArray = [UIImage(named: "Q1ZFyI.jpeg"),
                      UIImage(named: "asdasd.png"),
                      UIImage(named: "qweqwe.jpeg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //image
        self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        self.imageView.center = self.view.center
        self.imageView.image = self.imageArray[0]
        self.view.addSubview(self.imageView)
        
        //create segmented
        self.segmentedControl = UISegmentedControl(items: self.menuArray)
        self.segmentedControl.frame = CGRect(x: 100, y: 300, width: 200, height: 40)
        self.view.addSubview(self.segmentedControl)
        self.segmentedControl.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
    }

    @objc func selectedValue(_ target: UISegmentedControl) {
        if target == self.segmentedControl {
            let segmentIndex = target.selectedSegmentIndex
            self.imageView.image = imageArray[segmentIndex]
            
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }
}

