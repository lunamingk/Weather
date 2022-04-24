//
//  WeatherViewController.swift
//  weather
//
//  Created by  문민경 on 2022/04/17.
//


import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    
    let locationLabel = UILabel()
    let emojiLabel =  UILabel()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configure()
        setUpLayout()

    }
    
    func configure() {
        view.backgroundColor = .white
        locationLabel.text = "서울"
        emojiLabel.text = "🌞"
        locationLabel.font = .systemFont(ofSize: 30)
        emojiLabel.font = .systemFont(ofSize: 30)
        locationLabel.textColor = .gray
        
    }
    
    func setUpLayout() {
        view.addSubview(locationLabel)
        view.addSubview(emojiLabel)
        
        locationLabel.snp.makeConstraints{ make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(80)
            
        }
        
        emojiLabel.snp.makeConstraints{ make in
            make.left.equalTo(locationLabel.snp.right).offset(10)
            make.top.equalToSuperview().inset(80)
        }
    }

  
}


