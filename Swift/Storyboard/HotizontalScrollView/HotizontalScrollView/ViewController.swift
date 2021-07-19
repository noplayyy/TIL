//
//  ViewController.swift
//  HotizontalScrollView
//
//  Created by 노연주 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [
        "image1.png",
        "image2.png",
        "image3.png",
        "image4.png",
        "image5.png",
        "image6.png"
    ]
    
    var colors = [
        UIColor.red,
        UIColor.orange,
        UIColor.yellow,
        UIColor.green,
        UIColor.blue,
        UIColor.purple
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    func configureUI(){
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            imageView.image = UIImage(named: images[i])
            imageView.contentMode = .scaleAspectFit // 사진의 비율 맞춤
            
            imageView.backgroundColor = colors[i]
            
            let xPosition = self.view.frame.width * CGFloat(i)

            imageView.frame = CGRect(x: xPosition, y: 0, width: self.view.frame.width, height: self.view.frame.height) // 이미지 뷰가 화면의 전체를 덮게 된다

            scrollView.contentSize.width = self.view.frame.width * CGFloat(1+i)

            scrollView.addSubview(imageView)
        }
        
    }

}
