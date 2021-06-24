//
//  ViewController.swift
//  CheckboxButton
//
//  Created by 노연주 on 2021/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var allCheckBox: UIButton!
    @IBOutlet weak var checkBox1: UIButton!
    @IBOutlet weak var checkBox2: UIButton!
    @IBOutlet weak var checkBox3: UIButton!
    
    lazy var flag1 = false
    lazy var flag2 = false
    lazy var flag3 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func isChecked1(_ sender: UIButton) {
        if flag1 == false {
            checkBox1.setBackgroundImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag1 = true
        }
        else if flag1 == true {
            checkBox1.setBackgroundImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            flag1 = false
        }
    }
   
    @IBAction func isChecked2(_ sender: UIButton) {
        if flag2 == false {
            checkBox2.setBackgroundImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag2 = true
        }
        else if flag2 == true {
            checkBox2.setBackgroundImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            flag2 = false
        }
    }
    
    @IBAction func isChecked3(_ sender: UIButton) {
        if flag3 == false {
            checkBox3.setBackgroundImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag3 = true
        }
        else if flag3 == true {
            checkBox3.setBackgroundImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            flag3 = false
        }
    }
    
}
