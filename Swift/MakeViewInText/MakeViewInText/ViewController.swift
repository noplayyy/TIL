//
//  ViewController.swift
//  MakeViewInText
//
//  Created by 노연주 on 2021/07/24.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    //MARK: - Properties
    lazy var listLabelView = InTextView().then {
        $0.listLabel.text = "부탁할 것"
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        InTextViewSetting()
        addView()
        cornerRadius()
        location()
    }
    
    func addView(){
        view.addSubview(listLabelView)
    }
    
    func cornerRadius(){
        listLabelView.layer.cornerRadius = self.view.frame.width/75
    }
    
    func location(){
        listLabelView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(listLabelView.listLabel).offset(self.view.frame.width/12.5)
            make.height.equalTo(self.view.frame.height/31.23)
        }
    }
    
    func InTextViewSetting(){
        listLabelView.addSubview(listLabelView.listLabel)
        listLabelView.inTextViewLayoutSetting()
    }

}

//MARK: - Preview
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
