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
        image.layer.shadowOffset = CGSize(width: 5, height: 5)
        image.layer.shadowOpacity = 0.7
        image.layer.shadowRadius = 5
        image.layer.shadowColor = UIColor.gray.cgColor
        
        // 넘어간 부분 잘라내기 - 인스펙터 창에서 설정 가능
//        image.clipsToBounds = true
    }
    
    func cornerRadius(){
        image.layer.cornerRadius = 20
    }
}

