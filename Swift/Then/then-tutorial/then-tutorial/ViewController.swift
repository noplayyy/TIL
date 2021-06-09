//
//  ViewController.swift
//  then-tutorial
//
//  Created by 노연주 on 2021/06/09.
//

import UIKit

class ViewController: UIViewController {

// MARK: - UI
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.text = "THEN"
        label.font = UIFont.boldSystemFont(ofSize: 100)
        label.textColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var mySubLabel: UILabel = {
        let label = UILabel()
        label.text = "EZY-DEV-USE-THEN"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
  
// MARK: - LifeCycles
    override func loadView() {
        super.loadView()
        print(#fileID, #function, #line, "")
        configureUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "")    }

    
    // UI를 설정
    fileprivate func configureUI() {
        print(#fileID, #function, #line, "")
        
        self.view.addSubview(myLabel)
        NSLayoutConstraint.activate([
            myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        self.view.addSubview(mySubLabel)
        NSLayoutConstraint.activate([
            mySubLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mySubLabel.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 30)
        ])
    }

}

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


