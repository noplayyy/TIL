//
//  ViewController.swift
//  ViewAnimate
//
//  Created by 노연주 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var extendView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapOnButton(_ sender: Any) {
        UIView.animate(withDuration: 3, delay: 0.1, options: .curveEaseInOut, animations: { () -> Void in self.extendView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 500)
        },
        completion: { (didFinish) -> Void in })
    }
    
}

