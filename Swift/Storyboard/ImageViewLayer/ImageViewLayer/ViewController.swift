//
//  ViewController.swift
//  ImageViewLayer
//
//  Created by 노연주 on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        cornerRadius()
    }

    func configureUI(){
        image.contentMode = .scaleAspectFit
        
        // shadow
        image.layer.masksToBounds = false // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        image.layer.shadowOffset = CGSize(width: 0, height: 0) // 그림자 위치
        image.layer.shadowOpacity = 0.7 // 그림자 투명도 설정 (MIN = 0 ~ MAX = 1)
        image.layer.shadowRadius = 10 // 그림자 경계 선명도 설정
        image.layer.shadowColor = UIColor.gray.cgColor // 그림자 색상
        
        // 넘어간 부분 잘라내기 - 인스펙터 창에서 설정 가능
//        image.clipsToBounds = true
    }
    
    func cornerRadius(){
        image.layer.cornerRadius = 20
    }
}

