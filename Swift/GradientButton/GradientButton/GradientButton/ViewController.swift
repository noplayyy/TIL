//
//  ViewController.swift
//  GradientButton
//
//  Created by 노연주 on 2021/06/17.
//

import UIKit
import SnapKit
import Then
import DTGradientButton

class ViewController: UIViewController {

    let colors = [UIColor.rgb(red: 175, green: 157, blue: 242), UIColor.rgb(red: 104, green: 94, blue: 255), UIColor.rgb(red: 191, green: 204, blue: 255)];
    
    lazy var Button = UIButton().then {
        $0.setTitle("계속하기", for: .normal)
        $0.setTitleColor(UIColor(red: 255, green: 255, blue: 255, alpha: 1), for: .normal)
        $0.setGradientBackgroundColors(colors, direction: .toRight, for: .normal)
        
    }
    
    lazy var btn = UIButton().then {
        $0.setImage(UIImage(named: "dd"), for: .normal)
        $0.layer.cornerRadius = 15
        $0.alpha = 0.5
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        Button.layer.cornerRadius = 15
//        view.addSubview(Button)
//        Button.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.equalTo(self.view.frame.width/1.34)
//            make.height.equalTo(self.view.frame.height/16.24)
//        }
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    


}

extension UIColor{
    static func rgb(red: CGFloat ,green: CGFloat,blue:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func rgba(red: CGFloat ,green: CGFloat,blue:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

