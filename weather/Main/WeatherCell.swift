//
//  WeatherCell.swift
//  weather
//
//  Created by  문민경 on 2022/04/17.
//

import UIKit

class WeatherCell: UITableViewCell {
    let containerview = UIView()
    let locationLabel = UILabel()
    let emojiLabel = UILabel()
    let degreeLabel = UILabel()
    let degreeLabel2 = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.selectionStyle = .none

        containerview.backgroundColor = .lightGray
        containerview.layer.cornerRadius = 10
        locationLabel.text = "서울"
        locationLabel.font = UIFont.systemFont(ofSize: 20)
        emojiLabel.text = "🌞"
        emojiLabel.font = UIFont.systemFont(ofSize: 50)
        degreeLabel.text = "19"
        degreeLabel2.text = " °C"
        degreeLabel.font = UIFont.systemFont(ofSize: 60)
        degreeLabel.textColor = .white
        degreeLabel2.font = UIFont.systemFont(ofSize: 30)
        degreeLabel2.textColor = .white
    }
    
    func setUpLayout() {
        self.contentView.addSubview(containerview)
        containerview.addSubview(locationLabel)
        containerview.addSubview(emojiLabel)
        containerview.addSubview(degreeLabel)
        containerview.addSubview(degreeLabel2)
        
        containerview.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(10)
        
            
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview().inset(20)
        }
        
        emojiLabel.snp.makeConstraints { make in
            
            make.left.top.equalToSuperview().inset(10)
        }
        
        degreeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(degreeLabel2.snp.left)
            make.centerY.equalTo(degreeLabel2.snp.centerY)
        }
        
        degreeLabel2.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
        }
    }
}
