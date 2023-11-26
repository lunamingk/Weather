//
//  MainViewController.swift
//  weather
//
//  Created by  문민경 on 2022/04/17.
//

//This is written by Github

import UIKit
import SnapKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   //MainViewController 이거 한개가 3개의 타입을 가질 수 있다
    
    let tableView = UITableView()
    let weather = [
        Weather(location: "서울", temperature: 19, emoji: "🌞"),
        Weather(location: "부산", temperature: 25, emoji: "🌞"),
        Weather(location: "대구", temperature: 27, emoji: "🌞"),
        Weather(location: "울산", temperature: 27, emoji: "🌞"),
        Weather(location: "마산", temperature: 26, emoji: "🌞"),
        Weather(location: "수원", temperature: 20, emoji: "🌞"),
        Weather(location: "속초", temperature: 18, emoji: "🌞"),
        Weather(location: "강릉", temperature: 18, emoji: "🌞"),
        Weather(location: "용인", temperature: 20, emoji: "🌞")
    ]

    override func viewDidLoad() { // override (덮어쓴다) viewDidLoad(UIViewController안에 있는걸)
        super.viewDidLoad() // super(UIViewController가 부모임) 덮어쓸 땐 이름이 같아야 됨!
        // Do any additional setup after loading the view.
        
        configure()
        setUpLayout()

    }
    
    func configure() {
        self.navigationItem.title = "날씨"
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        //tableView > cell들을 반복해서 table에 보여줄 수 있음
        // 내가 보여주는 셀이 어떻게 생겼는지 알려줘야함.
        // weatherCell에서 만든걸 여기에 등록해야함! register를 호출해서 weatherCell등록
        // forCellReuseIdentifier > 셀의 재사용 아이디를 위해.. WeatherCell이라는 아이디 지정
        // 재사용 아이디? > 스크롤 할 때마다 아래꺼를 위로 올리는 과정에서 필요..
        // 같은 아이디끼리 재사용됨 > 메모리를 절약 할 수 있다.
        // register는 여러개 할 수 있음 > 모양에 따라.. / 다른 모양을 쓰고 싶으면 파일 새로 만들어서 코드짜고 여기에 등록 하면 된다.
        
        tableView.dataSource = self //dataSource (정보의 원천) 내가 테이블 뷰에게 정보를 준다.
        //self는 MainViewController / MainViewController 가 UITableViewDataSource라는 타입을 가졌기 때문에 dataSource는 UITableViewDataSource
        
        tableView.rowHeight = 150
        //rowHeight는 CGFloat 타입
        // Core Graphic에서 쓰는 Float, Core Graphic는 화면을 구성하는 그래픽
        tableView.delegate = self
        //tableView의 행동을 대신 처리한다. 그건 UITableViewDelegate가 한다 근데 그게 바로 나!(MainViewController)
        tableView.separatorStyle = .none
        // 기본값이 테이블 사이에 회색 선들이 있음. 그거 없애는 코드
        // .none 같이 .이 오면 앞에 type이 생략된것
        // 원래는 UITableViewCell.SeparatorStyle.none > 너무 길어서 .none
        // 지금 내 타입이 확실할 때 생략가능
    }
    
    func setUpLayout() {
        
        self.view.addSubview(tableView) // parameter
        // view > UIViewController안에 있는 UIView의 함수
        //(tableView) > addSubview는 함수, tableView는 인자
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            
            
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        
        cell.setWeather(weather: weather[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = WeatherViewController()
        viewController.setWeather(weather: weather[indexPath.row])
    
        navigationController?.pushViewController(viewController, animated: true)
        //navigationController : 화면의 이동을 관리하는 컨트롤러
        //navigationController > 앞에 self가 생략됨.
        //UIViewController안에 있음
        //?. > nil이면 그냥 무시, 실제 값이 있으면 실행
        // indexPath : 순서
        
    }
    
}

