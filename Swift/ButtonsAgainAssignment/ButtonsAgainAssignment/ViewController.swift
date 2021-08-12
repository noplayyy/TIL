//
//  ViewController.swift
//  ButtonsAgainAssignment
//
//  Created by 노연주 on 2021/08/12.
//

import UIKit

class ViewController: UIViewController {

    let firstButton : UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let secondButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    let thirdButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(.red, for: .normal)
        button.setTitle("Button", for: .normal)
        button.titleLabel?.font = UIFont.italicSystemFont(ofSize: 15)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI(){
        view.backgroundColor = .white
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)
        
        firstButton.frame = CGRect(x: self.view.frame.width/2 - 43, y: 250, width: 86, height: 53)
        secondButton.frame = CGRect(x: self.view.frame.width/2 - 15, y: 400, width: 30, height: 30)
        thirdButton.frame = CGRect(x: self.view.frame.width/2 - 43, y: 550, width: 86, height: 53)
        
        firstButton.layer.cornerRadius = 10
        secondButton.layer.cornerRadius = 15
    }

}

// MARK: - Preview

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
