//
//  WeatherCell.swift
//  weather
//
//  Created by  문민경 on 2022/04/17.
//

import UIKit

class WeatherCell: UITableViewCell {
    //UITableViewCell을 상속받음
    
    let containerview = UIView()
    let locationLabel = UILabel()
    let emojiLabel = UILabel()
    let degreeLabel = UILabel()
    let degreeLabel2 = UILabel.init()
    
    // 생성만 하면 뷰에 안나타남. addsubview 함수를 실행해야 화면에 나타난다.
    // 위치를 잡아주는건 snp(snapkit) autoLayout
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // init > 생성하는걸 override 덮어쓴다.
        // 애플이 기본 만들어놓은 생성은 진짜 생성만 한다.
        // 우리는 생성할 때 configure, setUpLayout을 실행해야 함.
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure() // 값을 설정하는 것
        setUpLayout() // addSubview, 위치 잡는거
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.selectionStyle = .none

        containerview.backgroundColor = .lightGray
        containerview.layer.cornerRadius = 10
        locationLabel.text = "서울"
        locationLabel.font = .systemFont(ofSize: 20)
        emojiLabel.text = "🌞"
        emojiLabel.font = .systemFont(ofSize: 50)
        degreeLabel.text = "19"
        degreeLabel2.text = " °C"
        degreeLabel.font = .systemFont(ofSize: 60)
        degreeLabel.textColor = .white
        degreeLabel2.font = .systemFont(ofSize: 30)
        degreeLabel2.textColor = .white
        
        // Type 생략 가능
        //degreeLabel2.textColor =
        //degreeLabel2.textColor = UIColor.white
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
    
    func setWeather(weather: Weather) {
        locationLabel.text = weather.location
        emojiLabel.text = weather.emoji
        degreeLabel.text = "\(weather.temperature)"
        // type을 float에서 string으로 만들기 위해 \()사용
    }
}
