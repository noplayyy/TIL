//
//  ViewController.swift
//  buttonYPosition
//
//  Created by 노연주 on 2021/08/05.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    //MARK: - Properties
    
    lazy var textField = UITextField().then {
        $0.textColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1)
        $0.placeholder = "textField"
    }
    
    lazy var YButton = UIButton().then {
        $0.setTitle("button", for: .normal)
        $0.backgroundColor = UIColor(red: 150/255, green: 141/255, blue: 255/255, alpha: 1)
    }

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    //MARK: - Helpers
    
    func configureUI(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.backgroundColor = .white
        view.addSubview(textField)
        view.addSubview(YButton)
        
        YButton.layer.cornerRadius = 10
        
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalToSuperview().dividedBy(27)
        }
        
        YButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(self.view.frame.width/17)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(16.24)
            make.bottom.equalToSuperview().offset(self.view.frame.height/32.48 * -1)
        }
    }
    
    @objc // 키보드가 보이면 버튼 올리기
    func keyboardWillShow(_ sender: Notification) {
        var keyboardHeight: CGFloat = CGFloat(0)
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            keyboardHeight = keyboardRectangle.height
        }
        YButton.frame.origin.y -= keyboardHeight
    }

    @objc // 키보드가 숨겨지면 다시 원 상태
    func keyboardWillHide(_ sender: Notification) {
        YButton.frame.origin.y = self.view.frame.height - YButton.frame.height - self.view.frame.height/32.48
    }
        
    // 다른 곳을 터치하면 textField 포인트 사라짐
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
}

//MARK: - Preview

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif


