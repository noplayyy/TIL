//
//  ViewController.swift
//  FirstProgrammaticallyAssignment
//
//  Created by 노연주 on 2021/08/11.
//

import UIKit

class ViewController: UIViewController {

    var flag:Bool = false
    
    let firstLabel : UILabel = {
        let label = UILabel()
        label.text = "LABEL"
        label.textColor = .red
        label.textAlignment = .center
        return label
    }()
    
    let firstButton : UIButton = {
        let button = UIButton()
        button.setTitle("BUTTON", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(firstLabel)
        view.addSubview(firstButton)
        
        firstLabel.frame = CGRect(x: 150, y: 350, width: 100, height: 50)
        firstButton.frame = CGRect(x: 150, y: 400, width: 100, height: 30)
    }
    
    @objc
    func onTapButton(){
        if flag == false {
            firstLabel.text = "라벨"
            flag = true
        } else if flag == true {
            firstLabel.text = "LABEL"
            flag = false
        }
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

