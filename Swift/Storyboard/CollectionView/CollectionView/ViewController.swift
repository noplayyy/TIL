//
//  ViewController.swift
//  CollectionView
//
//  Created by 노연주 on 2021/06/28.
//

import UIKit

// UICollectionViewDataSource - 몇 개의 view를 보여줄지
// UICollectionViewDelegate - view를 어떻게 보여줄지
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UICollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    //dequeueResuableCell 재활용 가능 한 셀을 큐 형태로 추가/제거한다. 만약 재사용 큐에 셀이 존재하면 dequeue하고 없으면 새로 생성
    //for:는 셀의 위치를 ​​지정하는 색인 ​​경로, 항상 데이터 원본 개체에서 제공하는 인덱스 경로를 지정해야 한다.
    //cell:은 아까 추가한 테이블 뷰 셀의 구분자(identifier)를 적는 곳이다. 이 구분자를 통해 셀을 가져오고 그 셀을 재활용힌다.

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

