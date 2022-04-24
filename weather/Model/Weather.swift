//
//  Weather.swift
//  weather
//
//  Created by  문민경 on 2022/04/24.
//

import Foundation

struct Weather {
    //지역, 온도, 이모지
    let location: String
    let temperature: Float
    let emoji: String
    
    init(location: String, temperature: Float, emoji: String) { // 생략 가능
        self.location = location
        self.temperature = temperature
        self.emoji = emoji
    }
}
