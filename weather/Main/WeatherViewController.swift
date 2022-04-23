//
//  WeatherViewController.swift
//  weather
//
//  Created by  문민경 on 2022/04/17.
//


import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    let tableView = UITableView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configure()
        setUpLayout()

    }
    
    func configure() {
        view.backgroundColor = .white
    }
    
    func setUpLayout() {

    }

  
}


