//
//  MainViewController.swift
//  weather
//
//  Created by  문민경 on 2022/04/17.
//

import UIKit
import SnapKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configure()
        setUpLayout()

    }
    
    func configure() {
        self.navigationItem.title = "날씨"
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.delegate = self
        
        tableView.separatorStyle = .none
    }
    
    func setUpLayout() {
        
        self.view.addSubview(tableView) // 중요함
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
            
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
    
}


