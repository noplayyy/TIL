//
//  ViewController.swift
//  ImageView
//
//  Created by 노연주 on 2021/06/24.
//

import UIKit

class ViewController: UIViewController {

    var isZoom = false // 확대가 됐는지 확인해주는 변수
    var imgEZY: UIImage? // image 변수
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resizeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgEZY = UIImage(named: "EZY_Image.png") // 변수에 이미지를 넣어준다.
        imageView.image = imgEZY // 이미지 뷰 이미지를 설정해준다.
    }

    @IBAction func btnResizeImage(_ sender: Any) {
        let scale:CGFloat = 2.0 // 버튼 클릭 시 2배 확대하기 위해 변수 저장
        var newWidth:CGFloat, newHeight:CGFloat // 확대할 크기 저장 변수
        
        if(isZoom){ // true 현재 상태가 확대 상태일 때
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale // 크기 설정
            resizeBtn.setTitle("확대", for: .normal) // 버튼 텍스트 변경
        }
        else{ // false 현재 상태가 축소 상태일 때
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale // 크기 설정
            resizeBtn.setTitle("축소", for: .normal) // 버튼 텍스트 변경
        }
        imageView.frame.size = CGSize(width: newWidth, height: newHeight) // 이미지 사이즈 변경
        isZoom = !isZoom
    }

}

