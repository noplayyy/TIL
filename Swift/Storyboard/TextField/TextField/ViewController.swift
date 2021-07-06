//
//  ViewController.swift
//  TextField
//
//  Created by 노연주 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var memo: UITextView!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }

    func configureUI(){
        self.memo.layer.borderWidth = 1.0
        self.memo.layer.borderColor = UIColor.black.cgColor
        
        self.pwTextField.isSecureTextEntry = true
    }
    
    @IBAction func showAlert(_ sender: Any) {
        let message = "제출 완료"
        
        let alert = UIAlertController(title: "Submit", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

