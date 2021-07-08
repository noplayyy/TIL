//
//  ViewController.swift
//  ChangeScreen
//
//  Created by 노연주 on 2021/07/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewA_btn: UIButton!
    @IBOutlet weak var viewB_btn: UIButton!
    
    let stboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickA(_ sender: Any) {
        let aController = stboard.instantiateViewController(withIdentifier: "AController")
        
        self.show(aController, sender: self)
    }
    
    @IBAction func clickB(_ sender: Any) {
        let bController = stboard.instantiateViewController(withIdentifier: "BController")
        
        self.show(bController, sender: self)
    }
}

