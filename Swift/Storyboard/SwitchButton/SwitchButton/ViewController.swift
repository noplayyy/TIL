//
//  ViewController.swift
//  SwitchButton
//
//  Created by 노연주 on 2021/07/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var switchBtn: UISwitch!
    @IBOutlet weak var onOffLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchDidChange(_ sender: UISwitch){
        if sender.isOn {
            view.backgroundColor = .yellow
            onOffLabel.text = "ON"
        } else {
            view.backgroundColor = .red
            onOffLabel.text = "OFF"
        }
    }


}

