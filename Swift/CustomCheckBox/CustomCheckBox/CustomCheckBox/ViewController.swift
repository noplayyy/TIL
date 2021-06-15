//
//  ViewController.swift
//  CustomCheckBox
//
//  Created by 노연주 on 2021/06/14.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    lazy var checkBox1 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(onTapButton1), for: .touchUpInside)
    }
    
    lazy var checkBox2 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(onTapButton2), for: .touchUpInside)
    }
    
    lazy var checkBox3 = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(onTapButton3), for: .touchUpInside)
    }
    
    lazy var AllCheckBox = UIButton().then {
        $0.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
        $0.addTarget(self, action: #selector(AonTapButton), for: .touchUpInside)
    }
    
    lazy var flag1 = false
    lazy var flag2 = false
    lazy var flag3 = false
    lazy var AllFlag = false

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    
    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(AllCheckBox)
        view.addSubview(checkBox1)
        view.addSubview(checkBox2)
        view.addSubview(checkBox3)
        
        AllCheckBox.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        checkBox1.snp.makeConstraints { make in
            make.top.equalTo(AllCheckBox).offset(100)
            make.left.equalToSuperview().offset(self.view.frame.width/4)
        }
        
        checkBox2.snp.makeConstraints { make in
            make.top.equalTo(AllCheckBox).offset(100)
            make.centerX.equalToSuperview()
        }
        
        checkBox3.snp.makeConstraints { make in
            make.top.equalTo(AllCheckBox).offset(100)
            make.right.equalToSuperview().offset(self.view.frame.width/4 * -1)
        }
    }
    
    @objc
    func onTapButton1(){
        if flag1 == false {
            checkBox1.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag1 = true
        } else if flag1 == true {
            checkBox1.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllFlag = false
            flag1 = false
        }
    }
    
    @objc
    func onTapButton2(){
        if flag2 == false {
            checkBox2.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag2 = true
        } else if flag2 == true {
            checkBox2.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllFlag = false
            flag2 = false
        }
    }
    
    @objc
    func onTapButton3(){
        if flag3 == false {
            checkBox3.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag3 = true
        } else if flag3 == true {
            checkBox3.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            AllFlag = false
            flag3 = false
        }
    }
    
    @objc
    func AonTapButton(){
        if AllFlag == false {
            AllCheckBox.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            checkBox1.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            checkBox2.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            checkBox3.setImage(UIImage(named: "EZY_CheckedBox"), for: .normal)
            flag1 = true
            flag2 = true
            flag3 = true
            AllFlag = true
        } else if AllFlag == true {
            AllCheckBox.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            checkBox1.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            checkBox2.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            checkBox3.setImage(UIImage(named: "EZY_UncheckedBox"), for: .normal)
            flag1 = false
            flag2 = false
            flag3 = false
            AllFlag = false
        }
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



