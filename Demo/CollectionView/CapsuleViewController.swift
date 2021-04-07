//
//  CapsuleViewController.swift
//  Demo
//
//  Created by liumenghua on 2021/4/7.
//

import Foundation
import UIKit

// TODO: 拆分代理和数据源
class CapsuleViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "UICollectionViewCellReuseID")
        return collection
    }()
    
    override func viewDidLoad() {
        setupSubviews()
    }
    
    private func setupSubviews() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(collectionView)
    }
    
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCellReuseID", for: indexPath)
        cell.backgroundColor = .red
        
        return cell
    }
}


