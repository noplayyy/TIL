//
//  ViewController.swift
//  Timer
//
//  Created by 노연주 on 2021/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0 // 타이머 간격 값
    var count = 1

    @IBOutlet weak var showTime: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI(){
        startBtn.layer.cornerRadius = 10
    }
    
    @objc
    func updateTime(){
        showTime.text = String(count)
        count += 1
    }

    @IBAction func onTapStart(_ sender: Any) {
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // timeInterval - 간격, target - 동작될 view, selector - 타이머 시작 시 실행 될 함수, userInfo - 사용자 정보, repeats - 반복여부
    }
}

