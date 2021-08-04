//
//  ViewController.swift
//  TapAndTouch
//
//  Created by 노연주 on 2021/08/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textMessage: UILabel!
    @IBOutlet weak var textTap: UILabel!
    @IBOutlet weak var textTouch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 터치가 시작 됐을 때
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch // 발생한 터치 이벤트 가져옴
        
        textMessage.text = "터치 시작"
        textTap.text = String(touch.tapCount) // touches 세트 안에 포함된 터치 수 출력
        textTouch.text = String(touches.count) // 터치 객체 중 첫번째 객체에서 탭의 개수 가져옴
    }
    
    // 터치된 손가락이 움직였을 때
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
            
        textMessage.text = "움직임"
        textTap.text = String(touch.tapCount)
        textTouch.text = String(touches.count)
    }
    
    // 화면에서 손가락이 떨어졌을 때
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
                   
        textMessage.text = "터치 끝"
        textTap.text = String(touch.tapCount)
        textTouch.text = String(touches.count)
    }

}

