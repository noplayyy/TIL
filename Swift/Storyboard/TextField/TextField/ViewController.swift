//
//  ViewController.swift
//  TextField
//
//  Created by 노연주 on 2021/07/06.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var memo: UITextView!
    @IBOutlet weak var pwTextField: UITextField!
    
    var empty: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
         self.view.endEditing(true)
   }

    func configureUI(){
        self.memo.layer.borderWidth = 1.0
        self.memo.layer.borderColor = UIColor.black.cgColor
        
        self.pwTextField.isSecureTextEntry = true
    }
    
    @IBAction func showAlert(_ sender: Any) {
        emptyText()
        if empty == true {
            let alert = UIAlertController(title: "Submit", message: "제출 완료", preferredStyle: .alert)

            let action = UIAlertAction(title: "OK", style: .default, handler: .none)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            clearText()
        } else {
            let errorAlert = UIAlertController(title: "Error", message: "ID와 PW를 모두 입력해주세요", preferredStyle: .alert)

            let action = UIAlertAction(title: "OK", style: .destructive, handler: .none)
                errorAlert.addAction(action)
                present(errorAlert, animated: true, completion: nil)
        }
    }
    

    func emptyText(){
        if idTextField.text?.isEmpty == false && pwTextField.text?.isEmpty == false {
            empty = true
        } else {
            empty = false
        }
    }
    
    func clearText(){
        idTextField.text = ""
        pwTextField.text = ""
        memo.text = ""
    }
}

