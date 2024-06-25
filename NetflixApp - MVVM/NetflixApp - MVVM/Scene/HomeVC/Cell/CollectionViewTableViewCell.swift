//
//  CollectionViewTableViewCell.swift
//  NetflixApp - MVVM
//
//  Created by Şafak Selim Sofioğlu on 25.06.2024.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionTableViewCell"
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: screenWidth * 0.3, height: screenWidth * 0.45)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MoviewCollectionViewCell.self, forCellWithReuseIdentifier: MoviewCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(contentView.snp.right)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
    
}


extension CollectionViewTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviewCollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .purple
        return cell
    }
}


















