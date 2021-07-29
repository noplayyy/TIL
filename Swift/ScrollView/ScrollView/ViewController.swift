//
//  ViewController.swift
//  ScrollView
//
//  Created by 노연주 on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollView =  UIScrollView(frame: CGRect(x: 10, y: 10, width: view.frame.size.width - 20, height: view.frame.size.height - 20))
        scrollView.backgroundColor = .green
        view.addSubview(scrollView)
    }

}

