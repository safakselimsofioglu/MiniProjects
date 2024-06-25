//
//  HomeViewController.swift
//  NetflixApp - MVVM
//
//  Created by Şafak Selim Sofioğlu on 25.06.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        //Bu metod, UITableView içinde kullanılacak hücre sınıfının veya türünün tanıtılmasını sağlar. Tanıtma işlemi, tablonun hücrelerini yönetmek ve tekrar kullanmak için gereklidir.
        let headerView = MainHeroHeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight * 0.35))
        tableView.tableHeaderView = headerView
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview() //Her yeri kaplayacak
        }
    }
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = "asddas"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
