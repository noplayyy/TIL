//
//  ViewController.swift
//  ColorButtonView
//
//  Created by 노연주 on 2021/06/18.
//

import UIKit

class ViewController: UIViewController {
    
    var redFlag = false // true일 때 view가 red
    var blueFlag = false // true일 때 view가 blue
    var yellowFlag = false // true일 때 view가 yellow
    var blackFlag = false // true일 때 view가 black
    var viewFlag = true // true일 때 view는 white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func redButton(_ sender: UIButton) {
        if viewFlag == true {
            self.view.backgroundColor = .red
            redFlag = true
            viewFlag = false
        } else if redFlag == false && viewFlag == false{
            self.view.backgroundColor = .red
            redFlag = true
        } else if redFlag == true && viewFlag == false {
            if self.view.backgroundColor == .red {
                self.view.backgroundColor = .white
                redFlag = false
                viewFlag = true
            } else {
                self.view.backgroundColor = .red
            }
        }
    }
    
    @IBAction func blueButton(_ sender: UIButton) {
        if viewFlag == true {
            self.view.backgroundColor = .blue
            blueFlag = true
            viewFlag = false
        } else if blueFlag == false && viewFlag == false{
            self.view.backgroundColor = .blue
            blueFlag = true
        } else if blueFlag == true && viewFlag == false {
            if self.view.backgroundColor == .blue {
                self.view.backgroundColor = .white
                blueFlag = false
                viewFlag = true
            } else {
                self.view.backgroundColor = .blue
            }
        }
    }
    
    @IBAction func yellowButton(_ sender: UIButton) {
        if viewFlag == true {
            self.view.backgroundColor = .yellow
            yellowFlag = true
            viewFlag = false
        } else if yellowFlag == false && viewFlag == false{
            self.view.backgroundColor = .yellow
            yellowFlag = true
        } else if yellowFlag == true && viewFlag == false {
            if self.view.backgroundColor == .yellow {
                self.view.backgroundColor = .white
                yellowFlag = false
                viewFlag = true
            } else {
                self.view.backgroundColor = .yellow
            }
        }
    }
    
    @IBAction func blackButton(_ sender: UIButton) {
        if viewFlag == true {
            self.view.backgroundColor = .black
            blackFlag = true
            viewFlag = false
        } else if blackFlag == false && viewFlag == false{
            self.view.backgroundColor = .black
            redFlag = true
        } else if blackFlag == true && viewFlag == false {
            if self.view.backgroundColor == .black {
                self.view.backgroundColor = .white
                blackFlag = false
                viewFlag = true
            } else {
                self.view.backgroundColor = .black
            }
        }
    }
}

